import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {
  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartdata;

  void _makeData() {
    _data = List<Sales>();
    _chartdata = List<charts.Series<Sales, String>>();

    final rnd = Random();
    for (int i = 2010; i < 2019; i++) {
      _data.add(Sales(i.toString(), rnd.nextInt(1000)));
    }

    _chartdata.add(charts.Series(
        id: 'Sales',
        colorFn: (_, __) =>
            charts.MaterialPalette.red.shadeDefault, //set chart color
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) =>
            charts.FillPatternType.forwardHatch, //chart fill pattern
        displayName: 'sales'));
  }

  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Sales Data'),
                Expanded(child: charts.BarChart<Sales>(_chartdata))
              ],
            ),
          )),
    );
  }
}
