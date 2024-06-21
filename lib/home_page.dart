import 'package:draft_1/calendar.dart';
import 'package:draft_1/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void
navigateToCalendarPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder:(context) => CalendarPage()
  ))
  ;}

void
navigateToHelpPage(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder:(context) => const HelpPage()
  ))
  ;}
class HomePage extends
    StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState()
  => _HomePageState();
}
class _HomePageState extends
    State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('selectedIndex: $_selectedIndex');
    if (_selectedIndex == 0) {
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => const HomePage()
      )
      );
    }
    else if (_selectedIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder:
          (context) => CalendarPage()
      )
      );
    }
      if (_selectedIndex == 2) {
       Navigator.push(context, MaterialPageRoute (builder:
       (context) => const HelpPage()
        )
        );
      }
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      if (_selectedIndex == 0) {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => const HomePage()
        )
        );
      }
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext
  context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Colors.lime,
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
                onPressed: () => navigateToCalendarPage(context),
                child: Text('Calendar')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Calendar',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Help',
            backgroundColor: Colors.pink,
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}