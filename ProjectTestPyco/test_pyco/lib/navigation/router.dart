import 'package:flutter/material.dart';
import 'package:testpyco/navigation/fade_in_router.dart';
import 'package:testpyco/navigation/paths.dart';
import 'package:testpyco/screen/home/view/home_page.dart';
import 'package:testpyco/screen/splash/view/splash_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PATH_SPLASH_PAGE:
      return FadeInRoute(widget: SplashPage());
    case PATH_HOME_PAGE:
      bool online = settings.arguments as bool;
      return FadeInRoute(
          widget: HomePage(
        online: online,
      ));
    default:
      return defaultNav(settings);
  }
}

MaterialPageRoute defaultNav(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Text('No path for ${settings.name}'),
      ),
    ),
  );
}
