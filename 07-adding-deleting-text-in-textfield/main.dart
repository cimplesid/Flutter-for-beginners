import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyTextInput()));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  final TextEditingController controller = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Input Text"), backgroundColor: Colors.deepOrange),
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              TextField(
                  decoration: InputDecoration(hintText: "Type in here"),
                  //onChanged is called whenever we add or delete something on Text Field
                  onSubmitted: (String str) {
                    setState(() {
                      result = result + '\n' + str;
                    });
                    controller.text = "";
                  },
                  controller: controller),
              //displaying input text
              Text(result)
            ]))));
  }
}
