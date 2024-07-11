import 'package:Daneshjooyar/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // Locale('en'), // English
        Locale('fa'), // Farsi
      ],

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900,
          ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.teal,
            ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}



