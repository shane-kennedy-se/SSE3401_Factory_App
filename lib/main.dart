import 'package:flutter/material.dart';
import 'package:lab_5_2/dashboard.dart';
import 'package:lab_5_2/settings.dart';
import 'package:lab_5_2/engineer_list.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    const EngineerListPage(),
    const Dashboard(),
    const Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35.0,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.person),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.home_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(Icons.settings),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
