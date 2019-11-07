import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/container_screen.dart';
import 'package:flutter_template/game_screen.dart';
import 'package:flutter_template/views/pages/charts/start_chart.dart';
// import 'package:flutter_template/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'helpers/storage_manager.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;

  await StorageManager.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.purple,
    statusBarColor: Colors.purple,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          // canvasColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => StartChart(),
          '/gameloop': (context) => GameScreen(),
          '/about': (context) => AboutScreen(),
          '/container': (context) => MenuDashboardPage(),
        },
      ),
    );
  }
}
