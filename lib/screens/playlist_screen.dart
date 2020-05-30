import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:synthMP/components/PlaylistPersistentHeader.dart';
import 'package:synthMP/constants/customcolors.dart';
import 'package:synthMP/screens/single_song_screen.dart';

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
    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: GestureDetector(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            print(notification.metrics.pixels);
            setState(() {
              _headerHeightOffset = notification.metrics.pixels
                  .clamp(0, MediaQuery.of(context).size.height * 0.3305);
            });
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: PlaylistPersistentHeader(
                      mmaxExtent: MediaQuery.of(context).size.height * 0.5,
                      mminExtent: MediaQuery.of(context).size.height * 0.25,
                      headerHeightOffset: _headerHeightOffset)),
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: EdgeInsets.all(25),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SingleSongScreen();
                      }));
                    },
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
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
