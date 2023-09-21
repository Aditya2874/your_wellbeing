import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_wellbeing/login.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:your_wellbeing/main.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    _checkLoginStatus();
    super.initState();
  }

  _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => login(),
      ),
    );
    FlutterNativeSplash.remove();
  }
  _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MyHomePage(title: "Home Page"),
      ),
    );
    FlutterNativeSplash.remove();
  }
  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false;
    bool isFirstTime = prefs2.getBool('isFirstTime') ?? true;
    if (loggedIn) {
      _navigateToHome();
    } else if(!isFirstTime){
      _navigateToLogin();
    }
    else{
      prefs2.setBool('isFirstTime', false);
      FlutterNativeSplash.remove();
    }
  }
  @override
  Widget build(BuildContext context) {
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
                _navigateToLogin();
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

