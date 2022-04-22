import 'package:cipher_frontend/base/base_layout.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SNAP Antenna Checker',
      theme: ThemeData(
        primaryColor: white,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        appBarTheme: AppBarTheme(
          color: background,
          titleTextStyle:
              GoogleFonts.baiJamjuree(fontWeight: titleWeight, fontSize: 20),
          elevation: 0,
        ),
        textTheme: GoogleFonts.baiJamjureeTextTheme(
                const TextTheme(bodyText2: TextStyle(fontWeight: normalWeight)))
            .apply(bodyColor: white),
      ),
      home: const BaseLayout(),
    );
  }
}
