import 'package:flutter/material.dart';

class Tinder extends StatefulWidget {
  static String nameRoute = "/Tinder";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Tinder();
    });
  }

  @override
  _TinderState createState() => _TinderState();
}

class _TinderState extends State<Tinder> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width / 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            height: 45,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  width: 75,
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    decoration: ShapeDecoration(
                      color:Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48)),
                    ),
                    child: Icon(
                      Icons.cloud,
                      color: Color.fromRGBO(251, 93, 100, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 18,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 500,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://tinder.com/static/tinder.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    height: 100,
                    left: 18,
                    right: 18,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: ListTile(
                        title: Text("Irene Sotelo"),
                        subtitle: Text("10 km away"),
                        trailing: Text("12"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 75,
                width: 75,
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(253, 60, 114, 0.4).withOpacity(0.2),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Color.fromRGBO(253, 60, 114, 1),
                      size: 50,
                    )),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                height: 75,
                width: 75,
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    gradient: LinearGradient(
                        colors: [Colors.green.withOpacity(0.2), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 50,
                      color: Colors.green,
                    )),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 78),
            height: 75,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48)),
                shadows: [
                  BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(0.2))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.contacts,
                      color: Colors.pink,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.pink.withOpacity(0.5),
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.pink.withOpacity(0.5),
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
