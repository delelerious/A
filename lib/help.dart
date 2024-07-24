import 'package:flutter/material.dart';
import 'survey.dart'; // Import the SurveyPage

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Help Page'),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SurveyPage()));
              },
              child: const Text('Take a Survey'),
            ),
          ],
        ),
      ),
    );
  }
}