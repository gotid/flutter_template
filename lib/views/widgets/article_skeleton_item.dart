import 'package:flutter/material.dart';
import 'package:flutter_template/views/helper/skeleton_helper.dart'
    show SkeletonDecoration, SkeletonItem;

class ArticleSkeletonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
            bottom: Divider.createBorderSide(context,
                width: 0.7, color: Colors.redAccent)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(isCircle: true, isDark: isDark),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 5,
                width: 100,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 5,
                width: 30,
                decoration: SkeletonDecoration(isDark: isDark),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                height: 6.5,
                width: screenWidth * 0.7,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              SizedBox(height: 10),
              Container(
                height: 6.5,
                width: screenWidth * 0.8,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              SizedBox(height: 10),
              Container(
                height: 6.5,
                width: screenWidth * 0.5,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 8,
                width: 20,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Container(
                height: 8,
                width: 80,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
            ],
          )
        ],
      ),
    );
  }
}
