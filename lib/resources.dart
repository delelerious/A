import 'package:flutter/material.dart';
import 'package:draft_1/helpchat.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  List<String> resources = ['a','b','c'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Resources')
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
            );
            },
            child: const Icon(Icons.chat_outlined),
        ),
        body: ScrollbarExample(),
      ),
    );
  }
}

class ScrollbarExample extends StatelessWidget {
  ScrollbarExample({super.key});

  final List<String> articleList = [
    'Depression (major depressive disorder)',
    'Anxiety Disorders',
    'Cognitive behavioral therapy',
    'Bipolar Disorder',
    'Cognitive Dissonance'
  ];
  final List<String> articleLinks = [
    'https://www.mayoclinic.org/diseases-conditions/depression/diagnosis-treatment/drc-20356013',
    'https://www.nimh.nih.gov/health/topics/anxiety-disorders',
    'https://www.mayoclinic.org/tests-procedures/cognitive-behavioral-therapy/about/pac-20384610',
    'https://www.nimh.nih.gov/health/topics/bipolar-disorder#:~:text=What%20is%20bipolar%20disorder%3F,day%2Dto%2Dday%20tasks',
    'https://health.clevelandclinic.org/cognitive-dissonance'
  ];
  final List<String> nameForAnotherList = [
    'assets/articleimage1.jpg',
    'assets/articleimage2.jpg',
    'assets/articleimage3.jpg'
  ];
ScrollController scrollControllerThing = ScrollController();
  Future<void> linkThing(String urlName) async {
    if (await canLaunchUrl(urlName as Uri)) {
      print('going to link');
      await launchUrl(urlName as Uri);
    }
    else {
      print('could not launch :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollControllerThing,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(nameForAnotherList.length, (index) {
            final text = articleList[index];
            final urlText = articleLinks[index];
            final image = nameForAnotherList[index];
            return Padding(
              padding: EdgeInsets.all(250),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(onTap: () async {
                    linkThing(urlText);
                  },
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(text),
                        SizedBox(height: 10.0),
                        Image.asset('$image'),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.0), Wrap(children: nameForAnotherList.map((asset) => Padding(padding: EdgeInsets.only(right: 10.0),
                  // child: Image.asset('$asset'),
                  SizedBox(height: 10.0),
                ],
              ),
            );
          }
          ).toList(),
        ),
      ),
    );
  }
}