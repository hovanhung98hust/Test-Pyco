import 'package:kiwi/kiwi.dart';
import 'injector.g.dart';

abstract class Injector {
  static Container _container;

  static void setup() {
    _container = Container();
    InjectorSetUp().config(_container);
  }

  static final Function<T>([String name]) resolve = _container.resolve;

  void config(Container container) {
    configInjector(container);
  }

  void configInjector(Container container);
}
