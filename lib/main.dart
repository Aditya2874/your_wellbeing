import 'package:flutter/material.dart';
import 'package:your_wellbeing/MedicineInfo.dart';
import 'package:your_wellbeing/familyInfo.dart';
import 'package:your_wellbeing/healthInfo.dart';
import 'package:your_wellbeing/introductionPage.dart';
import 'package:your_wellbeing/userProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your WellBeing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: IntroductionScreen(),
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
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
          child: BottomNavigationBar(
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
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
