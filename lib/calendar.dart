import 'package:flutter/material.dart';
import 'package:draft_1/appointment.dart';
import 'appointment.dart'; // Ensure this import is added

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? _selectedDate;

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