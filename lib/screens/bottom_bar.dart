import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_demo/constants.dart';
import 'package:notes_demo/screens/calculatorScreen.dart';
import 'package:notes_demo/screens/createNote.dart';
import 'package:notes_demo/screens/home.dart';
import 'package:notes_demo/screens/searchScreen.dart';
import 'package:notes_demo/screens/todoScreen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List _screens = [
    Home(),
    Todo(),
    Search(),
    CreateNote(),
    Calculator()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: _screens[_selectedIndex],
        ),


        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: bselected,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          elevation:10,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Notes'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'To Do'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.create), 
              label: 'Create Note'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator'
            ),

          ]
        ),

    );
  }
}