import 'package:flutter/material.dart';

class FoodMenuSelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('cimpleSid'),
              accountEmail: Text("dfdkfjdfd@gmail.com"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://wallpaperstudio10.com/static/wpdb/wallpapers/1920x1080/027202.jpg")))),
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('My Orders'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('My Account'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {
                    Navigator.pop(context); // close the drawer
                  },
                ),
              ],
            ),
          ),
        ],
      )),
      body: Container(
        child: ListView(
          children: <Widget>[
            Material(
              elevation: 8.0,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'Breakfast Order',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: Stack(
                        alignment: Alignment(-0.9, 0.8),
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/breakfast.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Coffee && Croissant',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens breakfast page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: Stack(
                        alignment: Alignment(-0.9, 0.8),
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/lunch.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Coffee && Breakfast Roll',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens lunch page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: Stack(
                        alignment: Alignment(-0.9, 0.8),
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/food.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Coffee && Muffin',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens food page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      child: Stack(
                        alignment: Alignment(-0.9, 0.8),
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              'images/drinks.jpg',
                              height: 120.0,
                              width: 370.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Coffee && Drinks',
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print('Opens drinks page');
                      //Navigator.of(context).pushNamed('/foodmenu_selected');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
