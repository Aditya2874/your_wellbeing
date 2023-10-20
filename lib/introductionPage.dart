import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:your_wellbeing/main.dart';
import 'package:your_wellbeing/mongodb.dart';
import 'package:your_wellbeing/signUp.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    super.initState();
  }
  _navigateToSignUp() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => signUp(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the App!'),
            ElevatedButton(
              onPressed: (){
                _navigateToSignUp();
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

