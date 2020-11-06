import 'package:flutter/material.dart';
import './views/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Stack(
        children: [
          AnimatedSplashScreen(
            splash: Text(' '),
            nextScreen: Home(),
            duration: 3000,
            //backgroundColor: ,
          ),
          Stack(
            children: [
              Opacity(
                opacity: .7,
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assests/images/image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 600),
                  text: ['Daily News'],
                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
