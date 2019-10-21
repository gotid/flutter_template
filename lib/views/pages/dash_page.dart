import 'package:flutter/material.dart';

import 'category_page.dart';
import 'mine_page.dart';

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  int _pageIndex = 0;

  get navBar => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        fixedColor: Colors.purple,
        onTap: onTap,
        items: items,
      );

  final PageController _pageController = PageController();
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜索')),
    BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('目录')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: <Widget>[
          CategoryPage(),
          MinePage(),
          CategoryPage(),
          MinePage()
        ],
      ),
    );
  }

  onTap(int index) => setState(() {
        _pageIndex = index;
        _pageController.jumpToPage(index);
      });

  onPageChanged(int index) => setState(() {
        _pageIndex = index;
      });
}
