import 'package:flutter/material.dart';

import './other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  String otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Drawer App"),
          backgroundColor: Colors.redAccent,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Raunak Hajela"),
                  accountEmail: Text("raunakhajela@gmail.com"),
                  currentAccountPicture: GestureDetector(
                    onTap: () => switchUser(),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture)),
                  ),
                  otherAccountsPictures: <Widget>[
                    GestureDetector(
                      onTap: () => print("this is the other user"),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(otherProfilePicture)),
                    ),
                  ],
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://orig00.deviantart.net/20eb/f/2015/030/6/f/_minflat__dark_material_design_wallpaper__4k__by_dakoder-d8fjqzu.jpg")))),
              ListTile(
                  title: Text("First Page"),
                  trailing: Icon(Icons.arrow_upward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OtherPage("First Page")));
                  }),
              ListTile(
                  title: Text("Second Page"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OtherPage("Second Page")));
                  }),
              Divider(),
              ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body:
            Center(child: Text("HomePage", style: TextStyle(fontSize: 35.0))));
  }
}

/**********************************************
***************Important Notes*****************
**********************************************/

//onTap: () => print("this is the other user")
// use this to display log messages on tap
