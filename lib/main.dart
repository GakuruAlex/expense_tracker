import 'package:flutter/material.dart';
import "package:expense_tracker/widgets/expenses.dart";
import 'package:google_fonts/google_fonts.dart';

final kSeedColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(123, 22, 22, 22),
);

final bottomSheetSeedColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 29, 28, 28),
);
final kDarkSeedColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(123, 116, 76, 2),
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expenses(),
      theme: ThemeData().copyWith(
        colorScheme: kSeedColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kSeedColor.onPrimary,
          foregroundColor: kSeedColor.onSecondaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: Color.fromARGB(255, 7, 7, 7),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: Color.fromARGB(0, 0, 0, 1),
          constraints: BoxConstraints(maxHeight: 650),
          modalBackgroundColor: Color.fromARGB(255, 15, 15, 15),
        ),

        textTheme: TextTheme(
          labelLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 28, 3, 250),
          ),
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 97, 241, 1),
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 97, 241, 1),
          ),
          bodyMedium: GoogleFonts.merriweather(
            fontSize: 18,

            color: Color.fromARGB(255, 97, 241, 1),
          ),
          displaySmall: GoogleFonts.pacifico(
            color: Color.fromARGB(255, 97, 241, 1),
            fontSize: 18,
          ),
        ),
      ),

      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkSeedColor,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkSeedColor.onPrimaryContainer,
          foregroundColor: kDarkSeedColor.onSecondaryContainer,
        ),
      ),
    );
  }
}
