import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_finder/src/dal/dal.dart';
import 'package:restaurant_finder/src/ioc/base_module.dart';

Future _setAppOrientation() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

Future<bool> _startApplication() async {
  await _setAppOrientation();

  await DatabaseManager.moveDatabaseToDocumentDir();

  MobileContainer().startModule(AppMobileModule());

  return true;
}

Future<Null> main() async {
  _startApplication();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Container(
          height: 300,
          color: Color(0xff615AAB),
        ));
  }
}
