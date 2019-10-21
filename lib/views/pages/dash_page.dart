import 'package:flutter/material.dart';

// import 'home_page.dart';
// import 'search_page.dart';
import 'category_page.dart';
import 'mine_page.dart';

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        fixedColor: Colors.purple,
        onTap: (int index) {
          setState(() {
            _pageIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Mine'),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: <Widget>[
          // HomePage(),
          // SearchPage(),
          CategoryPage(),
          MinePage(),
          CategoryPage(),
          MinePage()
        ],
      ),
    );
  }
}
