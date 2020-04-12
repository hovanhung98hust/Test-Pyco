import 'package:flutter/material.dart';
import 'package:testpyco/di/injector.dart';
import 'package:testpyco/navigation/navigation.dart';
import 'package:testpyco/navigation/paths.dart';
import 'package:testpyco/navigation/router.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation().navigatorKey,
      initialRoute: PATH_SPLASH_PAGE,
      onGenerateRoute: generateRoute,
    );
  }
}
