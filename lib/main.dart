import 'package:flutter/material.dart';
import "package:expense_tracker/widgets/expenses.dart";
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

final darkPrimaryColor = Color.fromARGB(255, 1, 68, 104);
final darkPrimaryTextColor = Color.from(
  alpha: 255,
  red: 255,
  green: 255,
  blue: 255,
);
final primaryColor = Color.fromARGB(72, 1, 37, 243);
final onPrimaryTextColor = Color.fromARGB(255, 255, 255, 255);
final accentColor = Color.fromARGB(255, 255, 87, 34);
final lightPrimaryColor = Color.fromARGB(255, 187, 222, 251);
final textColor = Color.fromARGB(255, 33, 33, 33);
final secondaryTextColor = Color.fromARGB(255, 117, 117, 117);

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expenses(),
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: primaryColor,

        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: AppBarTheme().copyWith(
          iconTheme: IconThemeData(color: accentColor, size: 36),

          backgroundColor: ColorScheme.fromSeed(
            seedColor: darkPrimaryColor,
          ).primary,
          foregroundColor: ColorScheme.fromSeed(
            seedColor: darkPrimaryColor,
          ).onPrimary,
        ),
        cardTheme: CardThemeData().copyWith(
          color: darkPrimaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: accentColor),
            borderRadius: BorderRadiusGeometry.all(
              Radius.circular(12),
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: darkPrimaryColor,
          constraints: BoxConstraints(maxHeight: 650),
          modalBackgroundColor: darkPrimaryColor,
        ),

        textTheme: TextTheme(
          labelLarge: GoogleFonts.acme(
            fontSize: 22,
            color: darkPrimaryTextColor,
          ),
          displayLarge: GoogleFonts.oswald(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: onPrimaryTextColor,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: onPrimaryTextColor,
          ),
          bodyMedium: GoogleFonts.oswald(
            fontSize: 22,

            color: onPrimaryTextColor,
          ),
        ),
      ),
    );
  }
}
