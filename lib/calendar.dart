import 'package:flutter/material.dart';
import 'package:draft_1/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                  appointmentOnSpecificDate(newDate);
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
          ],
        ),
      ),
    );
  }
}