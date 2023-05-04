import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:notes_demo/colors.dart';
import 'package:notes_demo/constants.dart';
import 'package:notes_demo/screens/bottom_bar.dart';
import 'package:notes_demo/screens/home.dart';
import 'package:notes_demo/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        //home: Home(),
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
        //   fontFamily: GoogleFonts.Bubblegum Sans().fontFamily,
          textTheme: GoogleFonts.bubblegumSansTextTheme(textTheme),
         ),
        home: Splash(),

    );
  }
}