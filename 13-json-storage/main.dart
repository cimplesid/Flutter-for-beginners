import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa
import 'package:path_provider/path_provider.dart'; //add path provider dart plugin on pubspec.yaml file

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController keyInputController = TextEditingController();
  TextEditingController valueInputController = TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  Map<String, String> fileContent;

  @override
  void initState() {
    super.initState();
    /*to store files temporary we use getTemporaryDirectory() but we need
    permanent storage so we use getApplicationDocumentsDirectory() */
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists)
        this.setState(
            () => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, String> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(JSON.encode(content));
  }

  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, String> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, String> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(JSON.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = JSON.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Tutorial"),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text(
            "File content: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(fileContent.toString()),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text("Add to JSON file: "),
          TextField(
            controller: keyInputController,
          ),
          TextField(
            controller: valueInputController,
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          RaisedButton(
            child: Text("Add key, value pair"),
            onPressed: () =>
                writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
}
