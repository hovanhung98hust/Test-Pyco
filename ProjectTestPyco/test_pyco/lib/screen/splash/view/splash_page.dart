import 'package:flutter/material.dart';
import 'package:testpyco/common/size.dart';
import 'package:testpyco/di/injector.dart';
import 'package:testpyco/navigation/navigation.dart';
import 'package:testpyco/navigation/paths.dart';
import 'package:testpyco/screen/splash/viewmodel/splash_vm.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loadData() async {
    SplashViewModel splashViewModel = Injector.resolve<SplashViewModel>();
    await splashViewModel.loadData();
    await Navigation.getInstance
        .navigateAndRemove(PATH_HOME_PAGE, arguments: splashViewModel.online);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Sizes().init(context);
    return Scaffold(
      backgroundColor: Colors.pinkAccent[200],
      body: Center(
        child: Text(
          'Tinder',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
