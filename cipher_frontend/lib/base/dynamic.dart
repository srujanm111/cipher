import 'package:flutter/cupertino.dart';
import 'package:cipher_frontend/base/resize_scale.dart';

class DynamicEdgeInsets extends EdgeInsets {

  DynamicEdgeInsets.all(double value) : super.all(value.w);

  DynamicEdgeInsets.only({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0,}) : super.only(
    left: left.w,
    top: top.w,
    right: right.w,
    bottom: bottom.w,
  );

  DynamicEdgeInsets.symmetric({double vertical = 0.0, double horizontal = 0.0,}) : super.symmetric(
    vertical: vertical.w,
    horizontal: horizontal.w,
  );

}

class DynamicSizedBox extends SizedBox {

  DynamicSizedBox({Key? key, double? width, double? height, Widget? child}) : super(key: key,
    child: child,
    width: width?.w,
    height: height?.w,
  );

}

class DynamicTextStyle extends TextStyle {

  DynamicTextStyle({
    Color? color,
    String? fontFamily,
    double? fontSize,
    double? height,
    FontWeight? weight,
  }) : super(
    color: color,
    fontFamily: fontFamily,
    fontSize: fontSize?.ssp,
    height: height,
    fontWeight: weight,
  );

}

class DynamicContainer extends Container {

  DynamicContainer({Key? key,
    Color? color,
    BoxDecoration? decoration,
    DynamicEdgeInsets? padding,
    double? width,
    double? height,
    Widget? child,
  }) : super(key: key,
    color: color,
    decoration: decoration,
    padding: padding,
    width: width?.w,
    height: height?.w,
    child: child,
  );

}

class DynamicBorderRadius extends BorderRadius {

  DynamicBorderRadius.circular(double radius) : super.circular(radius.w);

  DynamicBorderRadius.only({Radius topLeft = Radius.zero, Radius topRight = Radius.zero, Radius bottomLeft = Radius.zero, Radius bottomRight = Radius.zero,}) : super.only(
    topLeft: topLeft,
    topRight: topRight,
    bottomLeft: bottomLeft,
    bottomRight: bottomRight,
  );

}

class DynamicRadius extends Radius {

  DynamicRadius.circular(double radius) : super.circular(radius.w);

}