import 'package:flutter/material.dart';
import 'package:draft_1/helpchat.dart';

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
  final List<String> articleList = ['Article 1','Article 2','Article 3','Article 4','Article 5'];
 final List<List<String>> nameForAnotherList;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
      child: Column(
      children: List.generate(nameForAnotherList.length, (index)) {
        text = articleList[index];
        image = nameForAnotherList[index];
          return Padding(padding: EdgeInsets.all(250), child: Column( crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(text), ]
    )
      ).toList(),
      ),
      ),
      );
  }
}
