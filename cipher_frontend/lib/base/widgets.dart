import 'package:cipher_frontend/base/dynamic.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoundCard extends StatelessWidget {

  final double? height;
  final double? width;
  final Widget child;

  const RoundCard({
    Key? key,
    this.height,
    this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicContainer(
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: DynamicBorderRadius.circular(borderRadius),
      ),
    );
  }
}

class RoundButton extends StatefulWidget {

  final double? height;
  final double? width;
  final String text;
  final double fontSize;
  final VoidCallback onPress;

  const RoundButton({
    Key? key,
    this.height,
    this.width,
    required this.text,
    this.fontSize = 20,
    required this.onPress,
  }) : super(key: key);

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {

  bool isPressedDown = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => setState(() => isPressedDown = true),
      onPointerUp: (event) => setState(() => isPressedDown = false),
      onPointerCancel: (event) => setState(() => isPressedDown = false),
      child: GestureDetector(
        onTap: widget.onPress,
        child: AnimatedOpacity(
          opacity: isPressedDown ? 0.6 : 1,
          duration: Duration(milliseconds: isPressedDown ? 10 : 100),
          child: DynamicContainer(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: gray,
              borderRadius: DynamicBorderRadius.circular(borderRadius - 5),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: DynamicTextStyle(
                  color: white,
                  fontSize: widget.fontSize,
                  weight: normalWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class CustomDialog extends StatelessWidget {

  final Widget child;
  final Widget title;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: DynamicEdgeInsets.all(25),
        child: Center(
          child: DynamicContainer(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: DynamicBorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: DynamicEdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DynamicContainer(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          DynamicContainer(),
                          Align(
                            alignment: Alignment.center,
                            child: title,
                          ),
                        ],
                      ),
                    ),
                    DynamicSizedBox(height: 15),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class LoadingWheel extends StatelessWidget {
  const LoadingWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(white));
  }
}
