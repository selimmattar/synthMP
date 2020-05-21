import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:synthMP/components/PlaylistPersistentHeader.dart';
import 'package:synthMP/constants/customcolors.dart';

class PlaylistScreen extends StatefulWidget {
  PlaylistScreen({Key key}) : super(key: key);
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  double _headerBorderRadius = 0;
  double _headerHeightOffset = 0;
  @override
  Widget build(BuildContext context) {
    print(40 / 166);
    if (_scrollController.hasClients)
      print("scroll value : " + _scrollController.offset.toString());

    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: GestureDetector(child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  "assets/images/playlist01.jpg",
                                  height: (MediaQuery.of(context).size.height *
                                          0.4) -
                                      _headerHeightOffset,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 50,
                          left: 10,
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "A Synthwave Mix",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              )),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.pink,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        child: Text(
                      "50 songs",
                      style: TextStyle(
                          fontSize: 15, color: CustomColors.purpleLight02),
                    )),
                  ],
                ),
              ),
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  setState(() {
                    _headerHeightOffset = notification.metrics.pixels;
                  });
                  return true;
                },
                child: Expanded(
                    child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                      margin: EdgeInsets.all(20),
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
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                  ],
                )),
              )
            ],
          );
        },
      )

          /*CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              expandedHeight: (MediaQuery.of(context).size.height * 0.5),
              floating: true,
              flexibleSpace: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  "assets/images/playlist01.jpg",
                                  height: (MediaQuery.of(context).size.height *
                                      0.4),
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 50,
                          left: 10,
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "A Synthwave Mix",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              )),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.pink,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        child: Text(
                      "50 songs",
                      style: TextStyle(
                          fontSize: 15, color: CustomColors.purpleLight02),
                    )),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
              );
            }))
          ],
        ),*/

          /* child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  "assets/images/playlist01.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 50,
                          left: 10,
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "A Synthwave Mix",
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white),
                              )),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.pink,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        child: Text(
                      "50 songs",
                      style: TextStyle(
                          fontSize: 15, color: CustomColors.purpleLight02),
                    )),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
              );
            }))
          ],
        ),
     */
          ),
    );
  }
}