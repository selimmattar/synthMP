import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synthMP/components/searchbar.dart';
import 'package:synthMP/constants/customcolors.dart';
import 'package:synthMP/screens/playlist_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 25, left: 25, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Library",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15), child: SearchBar())
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Text(
                "Playlist",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 350,
              margin: EdgeInsets.only(left: 25),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PlaylistScreen();
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 250,
                          width: 250,
                          child: Hero(
                            tag: "playlistImage",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                "assets/images/playlist01.jpg",
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: Hero(
                              tag: "playlistName",
                              transitionOnUserGestures: true,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  "A Synthwave Mix",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )),
                        Container(
                            child: Hero(
                          tag: "playlistSongsNbr",
                          transitionOnUserGestures: true,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              "50 songs",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: CustomColors.purpleLight02),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 250,
                        width: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/playlist01.jpg",
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "A Synthwave Mix",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      Container(
                          child: Text(
                        "50 songs",
                        style: TextStyle(
                            fontSize: 15, color: CustomColors.purpleLight02),
                      )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 250,
                        width: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/playlist01.jpg",
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "A Synthwave Mix",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      Container(
                          child: Text(
                        "50 songs",
                        style: TextStyle(
                            fontSize: 15, color: CustomColors.purpleLight02),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "Favorites",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CustomColors.purpleLight01,
                    ),
                    child: Icon(
                      Icons.music_note,
                      size: 30,
                      color: CustomColors.purpleLight02,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Low Earth Orbit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "A Synthwave Mix",
                            style: TextStyle(
                                fontSize: 15,
                                color: CustomColors.purpleLight02),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: CustomColors.purpleLight01,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CustomColors.purpleLight01,
                    ),
                    child: Icon(
                      Icons.music_note,
                      size: 30,
                      color: CustomColors.purpleLight02,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Low Earth Orbit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "A Synthwave Mix",
                            style: TextStyle(
                                fontSize: 15,
                                color: CustomColors.purpleLight02),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: CustomColors.purpleLight01,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: CustomColors.purpleLight01,
                    ),
                    child: Icon(
                      Icons.music_note,
                      size: 30,
                      color: CustomColors.purpleLight02,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Low Earth Orbit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "A Synthwave Mix",
                            style: TextStyle(
                                fontSize: 15,
                                color: CustomColors.purpleLight02),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: CustomColors.purpleLight01,
                    ),
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
