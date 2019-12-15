import 'dart:async';
import 'package:tutorial/models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final ThemeData _themeData = ThemeData(
  primaryColor: Colors.blue,
);

/// Root MaterialApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _routes = <String, WidgetBuilder>{
      "/todos": (BuildContext context) => TodosPage(),
      // add another page,
    };
    return MaterialApp(
      title: "My App",
      theme: _themeData,
      home: HomePage(),
      routes: _routes,
    );
  }
}

/// place: "/"
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Home Page")),
      body: RaisedButton(
        child: Text("My Todos"),
        onPressed: _onPressed,
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/todos");
  }
}

/// place: "/todos"
class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Todos")),
      body: RefreshIndicator(
        child: ListView.builder(itemBuilder: _itemBuilder),
        onRefresh: _onRefresh,
      ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    Timer timer = Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Todo todo = getTodo(index);
    return TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index) {
    return Todo(false, "Todo $index");
  }
}

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoItemWidgetState createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("-"),
      title: Text(widget.todo.name),
      onTap: _onTap,
    );
  }

  void _onTap() {
    Route route = MaterialPageRoute(
      settings: RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => TodoPage(todo: widget.todo),
    );
    Navigator.of(context).push(route);
  }
}

/// place: "/todos/todo"
class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.todo}) : super(key: key);

  final Todo todo;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[
      Text("finished: " + widget.todo.finished.toString()),
      Text("name: " + widget.todo.name),
    ];
    return Scaffold(
      appBar: AppBar(title: Text("My Todo")),
      body: Column(
        children: _children,
      ),
    );
  }
}
