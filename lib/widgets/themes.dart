import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: blueishColor,
        accentColor: blueishColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonColor: lightBlueishColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6!.copyWith(color: Colors.white),
              ),
        ),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color blueishColor = Color(0xff403b58);
  static Color lightBlueishColor = Vx.indigo500;
}
