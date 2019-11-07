import 'package:flutter/material.dart';
import 'package:flutter_template/data.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class Break extends StatelessWidget {
  final height;
  Break(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class MenuItem extends StatelessWidget {
  final String text;
  MenuItem({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnition;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    screenHeight = deviceSize.height;
    screenWidth = deviceSize.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      // top: isCollapsed ? 0 : 0.2 * screenHeight,
      // bottom: isCollapsed ? 0 : 0.2 * screenHeight,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                          child: Icon(Icons.menu, color: Colors.white),
                          onTap: () {
                            setState(() {
                              isCollapsed
                                  ? _controller.forward()
                                  : _controller.reverse();
                              isCollapsed = !isCollapsed;
                            });
                          }),
                      Text('Dashboad For User',
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.settings, color: Colors.white)
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        FractionallySizedBox(
                          heightFactor: 0.8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.redAccent,
                            width: 100,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        FractionallySizedBox(
                          heightFactor: 0.8,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.greenAccent,
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  //SizedBox(height: 20),
                  Break(20.0),
                  Text(
                    'Transactions',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('MackBook'),
                        subtitle: Text('Apple'),
                        trailing: Text('899.99'),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 16.0,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnition = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnition,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    'https://avatars2.githubusercontent.com/u/12724186?s=460&v=4',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                new MenuItem(text: 'Dashboard'),
                new MenuItem(text: 'Messages'),
                new MenuItem(text: 'Utility Bills'),
                new MenuItem(text: 'Funds Transfer'),
                new MenuItem(text: 'Branches'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
