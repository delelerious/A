import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
final database = FirebaseDatabase.instanceFor(app: Firebase.app());
class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
   _SurveyPageState createState() => _SurveyPageState();
  }

class _SurveyPageState extends State<SurveyPage> {
  int qNumber = 0;
  List<String> questions = ['what was the name of your first family pet','how many fingers am i holding up','what is 1+1','what is 2+2','in \"euphoria\" by Kendrick Lamar, what does Kendrick say about Drakes fashion sense'];
  List<List<String>> answers = [['dog','john','cat','fish','mouse'],['1','2','3','4','5'],['1','2','3','4','5'],['1','2','3','4','5'],['i hate the way that you walk','i hate the way that you talk','i hate the way that you dress','i hate the way that you sneak diss','drake']];
  List<String> response = [];
  void submitResponse (String userResponse){
    setState(() {
      response.add(userResponse);
      if (qNumber<questions.length-1) {
        qNumber++;
      }
      else {
        submitSurvey();
        answerDatabase();
        }
      }
    );
    }

    void submitSurvey (){
  showDialog
  (context: context, builder: (BuildContext context){
  return AlertDialog(title: const Text('thanks for submitting'),
  content: Column(mainAxisSize: MainAxisSize.min,
  children: response.asMap().entries.map((entry)
  {int index = entry.key; String reply = entry.value;
  return Text('${questions[index]}:$reply');
  }).toList(),),
  actions: [TextButton(child: const Text('OK'), onPressed: (){Navigator.of(context).pop();
  setState(() {
  qNumber = 0;
  response.clear();
  });
  },
  ),
  ],
  );
  }
  );
}
void answerDatabase (){
   // FirebaseFirestore.instance.collection('answersCollection').add({
     // 'responses': response,
     // 'timestamp': Timestamp.now(),
      DatabaseReference CoolDatabase = database.ref().child('CollectionOfData');
      CoolDatabase.push().set({
        'Response':response,
        'timestamp':Timestamp.now,
      }
      );
   // });
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Survey Page'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(questions[qNumber],
            style: const TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 20.0),
          ...answers[qNumber].map((option) {
            return ElevatedButton(
              onPressed: () => submitResponse(option),
              child: Text(option),
            );
          }).toList(),
        ],
      ),
    ),
  );
}
}