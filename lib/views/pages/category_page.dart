import 'package:flutter/material.dart';
import 'package:flutter_template/models/tree.dart';
import 'package:flutter_template/view_models/category_model.dart';
import 'package:flutter_template/views/helpers/view_model_widget.dart';
import 'package:flutter_template/views/helpers/view_state_widget.dart';

import 'sub_category_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
      ),
      body: _categoryList(),
    );
  }

  _categoryList() => ViewModelWidget<CategoryModel>(
        model: CategoryModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return ViewStateBusyWidget();
          } else if (model.isError) {
            return ViewStateErrorWidget(
              error: model.viewStateError,
              message: '详细错误信息',
              onPressed: model.initData,
            );
          }
          // } else if (model.isEmpty) {
          //   return ViewStateEmptyWidget(onPressed: model.initData);
          // }
          return Scrollbar(
            child: ListView.builder(
              padding: EdgeInsets.all(15.0),
              itemCount: model.list.length,
              itemBuilder: (context, index) {
                Tree item = model.list[index];
                return CategoryItem(item);
              },
            ),
          );
        },
      );
}

class CategoryItem extends StatelessWidget {
  final Tree tree;

  CategoryItem(this.tree);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(tree.name, style: Theme.of(context).textTheme.subtitle),
          Wrap(
            spacing: 10,
            children: List.generate(
                tree.children.length,
                (index) => ActionChip(
                      label: Text(
                        tree.children[index].name,
                        maxLines: 1,
                      ),
                      onPressed: () {
                        print('${tree.name} -> ${tree.children[index].id}');
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return SubCategoryPage(
                            tree: tree,
                            index: index,
                          );
                        }));
                      },
                    )),
          )
        ],
      ),
    );
  }
}
