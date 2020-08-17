import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_finder/src/containers/login_container.dart';
import 'package:restaurant_finder/src/dal/dal.dart';
import 'package:restaurant_finder/src/ioc/base_module.dart';

Future _setAppOrientation() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setAppOrientation();
  await DatabaseManager.moveDatabaseToDocumentDir();

  MobileContainer().startModule(AppMobileModule());

  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurants',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('App Restaurants'),
          ),
          body: LoginContainer(),
        ));
  }
}
