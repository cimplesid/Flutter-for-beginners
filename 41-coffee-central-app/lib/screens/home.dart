import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
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
              accountName: Text('cimplesid'),
              accountEmail: Text("radafafa@gmail.com"),
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
        padding: EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                ),
                child: Stack(
                  alignment: Alignment(-0.9, 0.8),
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/breakfast.jpg',
                        height: 150.0,
                        width: 370.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Breakfast',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                print('Opens breakfast page');
                Navigator.of(context).pushNamed('/FoodMenuSelected');
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                ),
                child: Stack(
                  alignment: Alignment(-0.9, 0.8),
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/lunch.jpg',
                        height: 150.0,
                        width: 370.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Lunch',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                print('Opens breakfast page');
                Navigator.of(context).pushNamed('/FoodMenuSelected');
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                ),
                child: Stack(
                  alignment: Alignment(-0.9, 0.8),
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/food.jpg',
                        height: 150.0,
                        width: 370.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Food',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                print('Opens breakfast page');
                Navigator.of(context).pushNamed('/FoodMenuSelected');
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(8.0)),
                ),
                child: Stack(
                  alignment: Alignment(-0.9, 0.8),
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'images/drinks.jpg',
                        height: 150.0,
                        width: 370.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Drinks',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                print('Opens breakfast page');
                Navigator.of(context).pushNamed('/FoodMenuSelected');
              },
            ),
          ],
        ),
      ),
    );
  }
}
