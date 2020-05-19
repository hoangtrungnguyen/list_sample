import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicTutor extends StatefulWidget {
  static String nameRoute = "/MusicTutor";

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return MusicTutor();
    });
  }

  @override
  _MusicTutorState createState() => _MusicTutorState();
}

class _MusicTutorState extends State<MusicTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTextStyle(
        style: GoogleFonts.lato(),
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              leading: Container(),
//            title: Text("Find the best music tutorial"),
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned.fill(
                          child: Image.asset("assets/images/home bg.png")),
                      Align(
                          alignment: Alignment(-0.8, -0.1),
                          child: Text(
                            "Find the best\nmusic tutorial",
                            style: GoogleFonts.lato().copyWith(fontSize: 16),
                          )),
                      Align(
                        alignment: Alignment(1, -0.05),
                        child: Image.asset(
                          "assets/images/avatar.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 55,
                        height: MediaQuery.of(context).size.height / 5,
                        left: 0,
                        right: 0,
                        child: Banners(),
                      )
                    ],
                  ),
                ),
                titlePadding: EdgeInsets.zero,
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Transform.translate(
                offset: Offset(0, -MediaQuery.of(context).size.width / 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/page.png",
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onSubmitted: (String _) {},
                          decoration: InputDecoration(
                            hintText: "Search",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(127, 145, 185, 1),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(127, 145, 185, 1)),
                              borderRadius: BorderRadius.circular(36),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Text(
                          "Popular tutorial",
                          style: TextStyle(
                              color: Color.fromRGBO(65, 65, 106, 1),
                              fontSize: 33),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(

                            shrinkWrap: true,
                              physics:BouncingScrollPhysics() ,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                   decoration: ShapeDecoration(
                                        color:index == 0?Color.fromRGBO(
                                            253, 81, 112, 1) : Colors.white ,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                                            side: BorderSide(color: Color.fromRGBO(
                                                253, 81, 112, 0.4))
                                          ),
                                        shadows: [
                                          index == 0 ? BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              color: Color.fromRGBO(
                                                  253, 81, 112, 0.4)):BoxShadow(


                                          ),
                                        ]),
                                    child: Icon(Icons.play_arrow,color: index == 0? Colors.white:Color.fromRGBO(
                                        253, 81, 112, 1) ,),),
                                  title: Text("Basic tutorial of Guitar"),
                                  subtitle: Text("Marty Schwartz Guitar"),
                                );
                              }),
                        )
                      ]),
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class Banners extends StatefulWidget {


  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  PageController controller;

  double viewPortFraction = 0.5;
  double pageOffset = 0;
  double padding = 20;

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
      viewportFraction: viewPortFraction,
    )..addListener(() {
        setState(() {
          pageOffset = controller.page;
//          print("Page off set $pageOffset");
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    double
    return PageView.builder(
        itemCount: musicInstruments.length,
        controller: controller,
        itemBuilder: (ctx, index) {
          double scale = max(viewPortFraction,
                  (pageOffset - index).abs() + viewPortFraction) -
              0.5;
          print("scale $scale");
          return Transform.scale(
            alignment: Alignment.bottomCenter,
            scale: 1 - scale < 0.9 ? 0.9 : 1 - scale,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0, 0.6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        shadows: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 10,
                              spreadRadius: 10,
                              color: Color.fromRGBO(
                                  0, 38, 111, 0.1 * (1 - scale + 0.5))),
                        ]),
                    child: Text(
                      "${musicInstruments[index].name}",
                      style: TextStyle(
                          color: Color.fromRGBO(49, 77, 203, 1), fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment(0.1, -1),
                    child: Image.asset(
                      "${musicInstruments[index].imageAssets}",
                      height: MediaQuery.of(context).size.width / 3.5,
                    )),
              ],
            ),
          );
        });
  }
}

class MusicInstrument{
  String imageAssets;
  String name;

  MusicInstrument(this.imageAssets, this.name);

}

List<MusicInstrument> musicInstruments = [
  MusicInstrument("assets/images/Violin.png","Viloin"),
  MusicInstrument("assets/images/Guitar.png","Guitar"),
  MusicInstrument("assets/images/Saxophone.png","Saxophone"),
];