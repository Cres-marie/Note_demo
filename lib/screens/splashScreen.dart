import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_demo/screens/bottom_bar.dart';
import 'package:notes_demo/screens/home.dart';
import 'package:notes_demo/screens/landingScreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Landing(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Color(0xFF6ABD45),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(child: Image.asset('images/splash.png')),
            Center(child: Image.asset('images/smolleys.png')),
            CircularProgressIndicator(
              color: Colors.white,
            )
            //Image.asset('images/smolleys.png'),


          ],
      ),


    );
  }
}
