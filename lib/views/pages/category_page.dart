import 'package:flutter/material.dart';
import 'package:flutter_template/models/tree.dart';
import 'package:flutter_template/view_models/category_model.dart';
import 'package:flutter_template/views/widgets/category_item.dart';
import 'package:flutter_template/views/helpers/index.dart'
    show ViewModelWidget, ViewStateBusyWidget, ViewStateErrorWidget;

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
        title: Text('目录'),
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
