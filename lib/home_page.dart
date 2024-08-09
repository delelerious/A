import 'package:draft_1/calendar.dart';
import 'package:draft_1/help.dart';
import 'package:flutter/material.dart';
import 'package:draft_1/appointment.dart';
import 'package:draft_1/resources.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
  DateTime? _selectedDate;
  List <Map<String, dynamic>> appointments = [];
  void appointmentOnSpecificDate(DateTime date) {
    final CollectionReference appointmentCollection = FirebaseFirestore.instance.collection('collectionOfAppointmentData');
    final String appointmentDate = DateFormat('YYYY-MM-DD').format(date);
    appointmentCollection
        .where('date', isEqualTo: appointmentDate)
        .snapshots()
        .listen((snapshot){
      final List<Map<String, dynamic>> listOfAppointments = [];
      for(var doc in snapshot.docs) {
        listOfAppointments.add(doc.data() as Map <String, dynamic>);
      }
      setState((){
        appointments = listOfAppointments;
      }
      );
    }
    );
  }
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
          (context) => ResourcesPage()
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
      body: SingleChildScrollView(child: Column(children: [
        CalendarDatePicker(
          initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        onDateChanged: (newDate) {
          setState(() {
            _selectedDate = newDate;
            print ('selectedDate: $_selectedDate');
          });
        },
      ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: _selectedDate != null
                ? () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => AppointmentPage(selectedDate: _selectedDate!),

                ),
              );
            }
                : null,
          child: Text('Go to Appointment Page'),
        ),
        SizedBox(height: 20),
        Expanded(child: ListView.builder(itemCount: appointments.length, itemBuilder: (context, index){
          print('displaying appointment');
          return ListTile(title: Text('Appointment at ${appointments[index]['time']}'),
          );
        }
        )
        )
      ]
      )
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
            label: 'Resources',
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