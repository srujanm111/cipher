import 'dart:io';
import 'package:cipher_frontend/base/dynamic.dart';
import 'package:cipher_frontend/base/widgets.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:cipher_frontend/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

enum ProcessingState { language, ocrProcessing, apiFormatting }

class LanguageSelectionPage extends StatefulWidget {

  final XFile image;

  const LanguageSelectionPage({Key? key, required this.image}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {

  ProcessingState processingState = ProcessingState.language;
  String language = "Java";
  String? processedCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_rounded, color: white,),
        ),
        title: Text("Language Selection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(margin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: verticalSpace(margin, [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.file(File(widget.image.path)),
              ),
              processingState == ProcessingState.language ? Row(
                children: horizontalSpace(margin, [
                  Expanded(child: _languageButton("Java", "java.svg")),
                  Expanded(child: _languageButton("Python", "python.svg")),
                  Expanded(child: _languageButton("JavaScript", "javascript.svg")),
                ]),
              ) : null,
              _bottom(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _languageButton(String name, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          language = name;
        });
      },
      child: DynamicContainer(
        decoration: BoxDecoration(
          borderRadius: DynamicBorderRadius.circular(borderRadius),
          color: name == language ? gray : primary,
        ),
        child: Padding(
          padding: DynamicEdgeInsets.all(margin),
          child: Column(
            children: verticalSpace(5, [
              DynamicSizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset("assets/$image"),
              ),
              Text(name),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _bottom() {
    if (processingState == ProcessingState.language) {
      return RoundButton(
        text: "Upload",
        height: 52,
        onPress: startProcessing,
      );
    } else if (processingState == ProcessingState.ocrProcessing) {
      return Row(
        children: [
          Expanded(
            child: RoundButton(
              text: "Running OCR...",
              height: 52,
              onPress: () {},
            ),
          ),
          Padding(
            padding: DynamicEdgeInsets.symmetric(horizontal: margin),
            child: const LoadingWheel(),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: RoundButton(
              text: "Processing code...",
              height: 52,
              onPress: () {},
            ),
          ),
          Padding(
            padding: DynamicEdgeInsets.symmetric(horizontal: margin),
            child: const LoadingWheel(),
          ),
        ],
      );
    }
  }

  void startProcessing() {
    setState(() {
      processingState = ProcessingState.ocrProcessing;
    });
    processCodeImage(widget.image.path).then((string) {
      processedCode = string;
      setState(() {
        processingState = ProcessingState.apiFormatting;
      });
      // make API call to process code string
    });
  }

}
