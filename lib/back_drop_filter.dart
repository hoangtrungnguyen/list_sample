import 'dart:ui';

import 'package:flutter/material.dart';


class BackDropFilterSample extends StatefulWidget {
  static String nameRoute = "/BackDropFilter";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return BackDropFilterSample();
    });
  }

  @override
  _BackDropFilterSampleState createState() => _BackDropFilterSampleState();
}

class _BackDropFilterSampleState extends State<BackDropFilterSample> {

  Offset position = Offset(100, 100);

  double radius = 10;

  double xBlur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: FlutterLogo()),//
            ExpansionTile(
              title: Text(""),
              subtitle: Text(""),
              children: <Widget>[],
              trailing: Icon(Icons.details),
            ),
            Positioned(
              height: radius * 2,
              width: radius * 2,
              top: position.dy - radius,
              left: position.dx - radius,
              child: GestureDetector(
                //Vị trí khi đặt con trỏ
                onPanDown: (details) {
                  setState(() {
                    position = details.globalPosition;
                  });
                },
                // Khi con trỏ di chuyển
                onPanUpdate: (details) {
                  setState(() {
                    position = details.globalPosition;
                  });
                },
                //Hình Oval
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: xBlur, sigmaY:0),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ),
            //Điều khiển độ mờ và độ lớn
            Positioned(
              bottom: 10,
              left: 5,
              right: 0,
              child: Wrap(
                children: [
                  Text("R"),
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        radius = value;
                      });
                    },
                    value: radius,
                    max: 100,
                    min: 10,
                  ),
                  Text("Blur"),
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        xBlur = value;
                      });
                    },
                    value: xBlur,
                    max: 50,
                    min: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

