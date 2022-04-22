import 'package:cipher_frontend/base/dynamic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

List<Widget> verticalSpace(double gap, List<Widget?> children) {
  children.removeWhere((element) => element == null);
  for (int i = 1; i < children.length; i+= 2) {
    children.insert(i, DynamicSizedBox(height: gap,));
  }
  return children.cast<Widget>();
}

List<Widget> horizontalSpace(double gap, List<Widget?> children) {
  children.removeWhere((element) => element == null);
  for (int i = 1; i < children.length; i+= 2) {
    children.insert(i, DynamicSizedBox(width: gap,));
  }
  return children.cast<Widget>();
}

Future<T?> push<T>(Widget page, BuildContext context, {bool fade = true, bool fullScreenDialog = false}) async {
  return Navigator.of(context).push(
    fade ? PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) => page,
      transitionsBuilder: (context, animation1, animation2, child) => FadeTransition(opacity: animation1, child: child,),
    ) : CupertinoPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullScreenDialog
    ),
  );
}

Future<T?> showCustomDialog<T>(BuildContext context, Widget dialog, {bool barrierDismissible = true}) {
  barrierDismissible = true;
  return showCupertinoDialog<T>(context: context, builder: (context) => dialog, barrierDismissible: barrierDismissible);
}

Future<String> processCodeImage(String imagePath) async {
  final inputImage = InputImage.fromFilePath(imagePath);
  final textDetector = GoogleMlKit.vision.textDetector();
  final recognizedText = await textDetector.processImage(inputImage);


  return "TODO";
}