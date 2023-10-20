import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_wellbeing/MedicineInfo.dart';
import 'package:your_wellbeing/familyInfo.dart';
import 'package:your_wellbeing/healthInfo.dart';
import 'package:your_wellbeing/introductionPage.dart';
import 'package:your_wellbeing/mongodb.dart';
import 'package:your_wellbeing/userProfile.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // Ensure Flutter is initialized
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your WellBeing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: isLoggedIn ? MyHomePage(title: "Your WellBeing") : IntroductionScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    familyInfo(),
    MedicineListScreen(),
    HealthInfo(),
    UserProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
          BottomNavigationBar(
              backgroundColor: Colors.indigo, // Set the background color
              selectedItemColor: Colors.blue, // Set the color of the selected item
              unselectedItemColor: Colors.black, // Set the color of unselected items
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                // Add more items as needed
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              // Add your onTap and currentIndex properties as needed
            ),
    );
  }
}
