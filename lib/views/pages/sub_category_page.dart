import 'package:flutter/material.dart';
import 'package:flutter_template/models/tree.dart';

import 'article_list_page.dart';

class SubCategoryPage extends StatelessWidget {
  final Tree tree;
  final int index;

  const SubCategoryPage({Key key, this.tree, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tree.children.length,
      initialIndex: index,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tree.name),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
                tree.children.length,
                (i) => Tab(
                      text: tree.children[i].name,
                    )),
          ),
        ),
        body: TabBarView(
          children: List.generate(tree.children.length,
              (i) => ArticleListPage(tree.children[i].id)),
        ),
      ),
    );
  }
}
