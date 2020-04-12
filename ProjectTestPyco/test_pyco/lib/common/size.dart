import 'package:flutter/widgets.dart';

class Sizes {
  /* Config size with width height screen
  * */
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double blockWidth;
  static double size;
  static double blockHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    blockWidth = (screenWidth - _safeAreaHorizontal) / 100;
    blockHeight = (screenHeight - _safeAreaVertical) / 100;

  }

}
