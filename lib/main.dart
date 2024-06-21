import 'package:draft_1/splash.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
 // WidgetsFlutterBinding.ensureInitialized();
 // try {
   // await Firebase.initializeApp();
    runApp(const MyApp());
 // }
 // catch(e) {
   // runApp(MyApp(showError: true, errorMessage: e.toString()));
 // }
}
class MyApp extends
    StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme:
        ColorScheme.fromSeed(seedColor:
        Colors.deepPurple),
      useMaterial3: true,
    ),
      home: Splash()
    );
  }
}

