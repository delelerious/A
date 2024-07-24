import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AppointmentPage extends StatelessWidget {
  final DateTime selectedDate;

  AppointmentPage({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat.yMMMMd().format(selectedDate);
    return Scaffold(
      appBar: AppBar(
        title: Text('Make an Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Selected Date: $formattedDate'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _makeAppointment(context, selectedDate);
              },
              child: Text('Make Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  void _makeAppointment(BuildContext context, DateTime date) {
    // Logic to make an appointment using the selected date
    // For example, saving to a database or making a network request
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Appointment made for ${date.toLocal()}'.split(' ')[0])),
    );
  }
}