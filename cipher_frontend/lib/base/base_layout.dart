import 'package:cipher_frontend/base/dynamic.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:cipher_frontend/functions.dart';
import 'package:cipher_frontend/pages/files.dart';
import 'package:cipher_frontend/pages/home.dart';
import 'package:cipher_frontend/pages/language_selection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BaseLayout extends StatefulWidget {

  const BaseLayout({Key? key}) : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: white,
            onPressed: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.camera);

              if (image != null) {
                push(LanguageSelectionPage(image: image), context, );
              }
            },
            child: SvgPicture.asset(
              "assets/camera-shutter.svg",
              color: logo,
              height: 42,
              width: 42,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavIcon(Icon(Icons.home, color: white.withOpacity(pageIndex == 0 ? 1 : 0.5)), () {
              setState(() => pageIndex = 0);
            }),
            DynamicSizedBox(width: 100),
            NavIcon(Icon(Icons.folder, color: white.withOpacity(pageIndex == 1 ? 1 : 0.5)), () {
              setState(() => pageIndex = 1);
            }),
          ],
        ),
      ),
      body: _getView(pageIndex),
    );
  }

  Widget _getView(int index) {
    return index == 0 ? const HomePage() : const FilesPage();
  }

}

class NavIcon extends StatelessWidget {

  final Widget child;
  final VoidCallback onPress;

  const NavIcon(this.child, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SizedBox(
          height: 35,
          width: 35,
          child: FittedBox(
            child: child,
          ),
        ),
      ),
    );
  }

}