import "package:draft_1/home_page.dart";
import "package:flutter/material.dart";
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome"),
        ),
        backgroundColor: Colors.lightGreen.shade400,
        body: Center(
            child: Column(
                children: <Widget>[
                  Positioned(
                      bottom: 150.0,
                      child: Image.asset('assets/iamge2.jpg',
                        height: 100,
                        width: 100,
                      )
                  )
                ]
            )
        )
    );
  }
}