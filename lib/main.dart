import 'package:flutter/material.dart';
import 'package:listsample/music_tutor.dart';
import 'package:listsample/tinder.dart';

import 'back_drop_filter.dart';
import 'color_filter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: () {
              Navigator.of(context).push(Tinder.route());
            },
              child: Text("Tinder"),
            ),

            RaisedButton(onPressed: () {
              Navigator.of(context).push(ColorMixed.route());
            },
              child: Text("Color Mixed"),
            ),
            RaisedButton(onPressed: () {
              Navigator.of(context).push(BackDropFilterSample.route());
            },
              child: Text("Backdrop Filter"),
            ),
            RaisedButton(onPressed: () {
              Navigator.of(context).push(MusicTutor.route());
            },
              child: Text("Music Tutor"),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {  },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
