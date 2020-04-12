import 'package:kiwi/kiwi.dart';
import 'package:testpyco/screen/home/viewmodel/home_vm.dart';
import 'package:testpyco/screen/splash/viewmodel/splash_vm.dart';
import 'package:testpyco/service/data_helper.dart';
import 'package:testpyco/service/tinder_service.dart';

import 'injector.dart';

class InjectorSetUp extends Injector {
  @override
  void configInjector(Container container) {
    container
      ..registerSingleton((c) => TinderService())
      ..registerSingleton((c) => DataBaseHelper())
      ..registerSingleton(
          (c) => SplashViewModel(c<TinderService>(), c<DataBaseHelper>()))
      ..registerSingleton((c) => HomeViewModel(c<DataBaseHelper>()));
  }
}
