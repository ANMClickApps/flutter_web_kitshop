import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_kitshop/pages/components_sign_up/sign_up/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KITShop - landing page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          primary: Colors.blueGrey,
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF3D45EE),
          ),
        )),
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

