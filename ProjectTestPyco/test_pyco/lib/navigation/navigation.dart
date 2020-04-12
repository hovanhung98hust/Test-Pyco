import 'package:flutter/material.dart';

class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final Navigation _instance = Navigation._internal();

  factory Navigation() => _instance;

  Navigation._internal();

  // ignore: prefer_constructors_over_static_methods
  static Navigation get getInstance {
    if (_instance == null) {
      return Navigation();
    }
    return _instance;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  bool goBack({dynamic result}) {
    return navigatorKey.currentState.pop(result);
  }
}
