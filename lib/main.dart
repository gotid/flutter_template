import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'helpers/storage_manager.dart';
import 'views/pages/dash_page.dart';

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
        debugShowCheckedModeBanner: false,
        home: DashPage(),
      ),
    );
  }
}
