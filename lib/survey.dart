import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

final FirebaseFirestore database = FirebaseFirestore.instance;
class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
   _SurveyPageState createState() => _SurveyPageState();
  }

class _SurveyPageState extends State<SurveyPage> {
  late CollectionReference
  surveyCollection;
  @override
  void initState() {
    checkFirestoreConnection();
    super.initState();
    surveyCollection = FirebaseFirestore.instance.collection('collectionOfData');
  }
void checkFirestoreConnection()
  async {
    print("Checking Firestore connection...");
    try {
      var snapshot = await
      database.collection('users').get();
      print('Connection successful. Documents count:${snapshot.docs.length}');
    }
    catch (e) {
      print('Failed to connect to Firestore: $e');
    }
  }
  int qNumber = 0;
  List<String> questions = ['How was your day today on a scale of 1-5?','How often do you feel irritable or sad?','Have you ever had negative thoughts about yourself? If so, how often do they occur?','In the past week, have you had thoughts of hurting yourself or others?','How many hours of sleep do you typically average per night?'];
  List<List<String>> answers = [['1','2','3','4','5'],['Never','Rarely','Occasionally','Often','Very often'],['Never','Rarely','Occasionally','Often','Very often'],['Yes','No'],['1-2','3-4','5-6','7-8','9-10']];
  List<String> response = [];
  void submitResponse (String userResponse){
    setState(() {
      response.add(userResponse);
      if (qNumber<questions.length-1) {
        qNumber++;
      }
      else {
        print('the survey was submitted');
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

void answerDatabase () async {
    print('saving');
  try {
    await database.collection('realCollectionOfData').add({
      'Response': response,
      // 'timestamp': 'time',
    }
    );
    print('success');
  }
  catch (e){print('it did not work - ${e.toString()}');
  }
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

// change project level(not app level) build.gradle to this:
//
//
// buildscript { repositories { google() mavenCentral() } dependencies { // Add the Google services Gradle plugin dependency classpath 'com.google.gms:google-services:4.4.1' // Add other dependencies if needed } } allprojects { repositories { google() mavenCentral() } } rootProject.buildDir = '../build' subprojects { project.buildDir = "${rootProject.buildDir}/${project.name}" project.evaluationDependsOn(':app') } tasks.register("clean", Delete) { delete rootProject.buildDir }
//
//
//
// Change miniSDK version on project level build.gradle to 21 instead of 19
//
//
// Verify google-services.json is in app level folder
//
//
// Hit sync now when changing any gradle files