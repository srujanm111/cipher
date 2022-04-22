import 'dart:ui';

class ResizeScale {

  static const num _viewPortWidth = 390;
  static const num _viewPortHeight = 844;
  static final _pixelRatio = window.devicePixelRatio;
  static final _screenWidth = window.physicalSize.width;
  static final _screenHeight = window.physicalSize.height;
  static final _textScaleFactor = window.textScaleFactor;

  static double get textScaleFactor => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static double get screenWidth => _screenWidth / _pixelRatio;

  static double get screenHeight => _screenHeight / _pixelRatio;

  static double get screenWidthPx => _screenWidth;

  static double get screenHeightPx => _screenHeight;

  static double get scaleWidth => screenWidth / _viewPortWidth;

  static double get scaleHeight => screenHeight / _viewPortHeight;

  static double get scaleText => scaleWidth;

  static bool get isTablet => screenWidth > 600;

  static bool get shouldNotResize => screenWidth > 414;

  static double setWidth(num width) => shouldNotResize ? width * 1.0 : width * scaleWidth;

  static double setHeight(num height) => shouldNotResize ? height * 1.0 : height * scaleHeight;

  static double setSp(num fontSize) => shouldNotResize ? fontSize * 1.0 : fontSize * scaleText;
}

extension SizeExtension on num {

  double get w => ResizeScale.setWidth(this);

  double get h => ResizeScale.setHeight(this);

  double get ssp => ResizeScale.setSp(this);

}
