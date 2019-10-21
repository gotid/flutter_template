import 'package:flutter/material.dart';
import 'package:flutter_template/models/tree.dart';
import 'package:flutter_template/views/pages/sub_category_page.dart';

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
                onPressed: onPress(context, index),
              ),
            ),
          )
        ],
      ),
    );
  }

  onPress(context, index) => () {
        print('${tree.name} -> ${tree.children[index].id}');
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return SubCategoryPage(
            tree: tree,
            index: index,
          );
        }));
      };
}
