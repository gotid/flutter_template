import 'package:flutter/material.dart';
import 'package:flutter_template/models/article.dart';
import 'package:flutter_template/views/helper/image_helper.dart'
    show ImageWidget, ImageType;

class ArticleListItem extends StatelessWidget {
  final Article article;

  ArticleListItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: Divider.createBorderSide(context, width: 0.7))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipOval(
                      child: ImageWidget(
                        imageType: ImageType.random,
                        url: article.author,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
