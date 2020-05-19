import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorMixed extends StatefulWidget {
  static String nameRoute = "/ColorFilter";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return ColorMixed();
    });
  }

  @override
  _ColorMixedState createState() => _ColorMixedState();
}

class _ColorMixedState extends State<ColorMixed> {
  int red = 0;
  int green = 0;
  int blue = 0;
  double radians = 0;
  double border = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Red"),
          Slider(
            activeColor: Color.fromRGBO(red, 0, 0, 1),
            onChanged: (double value) {
              setState(() {
                red = value.floor();
              });
            },
            value: red.toDouble(),
            label: "Red",
            min: 0,
            max: 255,
          ),
          Text("Green"),
          Slider(
            activeColor: Color.fromRGBO(0, green, 0, 1),
            onChanged: (double value) {
              setState(() {
                green = value.floor();
              });
            },
            value: green.toDouble(),
            label: "Green",
            min: 0,
            max: 255,
          ),
          Text("Blue"),
          Slider(
            activeColor: Color.fromRGBO(0, 0, blue, 1),
            onChanged: (double value) {
              setState(() {
                blue = value.floor();
              });
            },
            value: blue.toDouble(),
            label: "Blue",
            min: 0,
            max: 255,
          ),
          Text("Angle"),
          Slider(
            value: radians,
            onChanged: (value) {
              setState(() {
                radians = value;
              });
            },
            max: pi * 2,
            min: 0,
          ),
          Text("Corner"),
          Slider(
            value: border,
            onChanged: (value) {
              setState(() {
                border = value;
              });
            },
            max: 100,
            min: 0,
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: radians,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(border)),
                        color: Color.fromRGBO(red, green, blue, 1),
                      ),
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child:  Text("RGB=(${red}, $green, $blue)"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),

        ],
      ),
    );
  }
}
