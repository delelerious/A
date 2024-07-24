import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_widget/flutter_chat_widget.dart';

class ChatPage extends StatefulWidget {
  String apiKey = 'AIzaSyDjKfZDuD93HV0W7w6TyvJ3m91aIuWayqQ';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // final prompt = 'Write a story about a magic backpack.';
  // final content = [Content.text(prompt)];
  String generatedResponse = '';
 Widget? chat;
 Widget? responseMessage;
 List<Widget> listOfMessages = [];
  Future<void> responseRetrieval(String text) async {
    final response = await generatingContent(widget.apiKey, text);
    setState(() {
      listOfMessages.add(
      ReceivedMessage(
        message: response!,
        background: Colors.black12,
        textColor: Colors.black,
      )
      );
    });
}
Future<String?> generatingContent(String apiKey, String text) async {
    final model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);
    final prompt = text;
   final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  print (response.text);
   return response.text;
}

void sendingMessage (String text) {
    setState(() {
      listOfMessages.add(
      SentMessage(
          message: text,
          background: Colors.greenAccent,
          textColor: Colors.white
      )
      );
    });
}
  @override
  void initState () {
    super.initState();
  }
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Chat')
      ),
          body: Column(
            children: [Expanded(child: ListView.builder (reverse: false, itemCount: listOfMessages.length, itemBuilder: (context, index) {
              return listOfMessages [index];
            },
            ),
            ),
                Expanded(flex: 1, child: responseMessage!= null ? Text(responseMessage as String): Container()
              ),
           ],
            ),

             bottomNavigationBar: MessageBar(onCLicked: (text) {
              if (text.isNotEmpty) {
                sendingMessage(text);
                responseRetrieval(text);
              }
            }
            )
    );
  }
}