import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthMP/constants/customcolors.dart';

class PlaylistPersistentHeader extends SliverPersistentHeaderDelegate {
  PlaylistPersistentHeader(
      {this.mmaxExtent, this.mminExtent, this.headerHeightOffset});
  final double mmaxExtent;
  final double mminExtent;
  double headerHeightOffset = 0;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print("shrink offset is :" + shrinkOffset.toString());
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
                top: 10,
                left: 10,
                child: Icon(
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Icons.arrow_back_ios
                      : Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(microseconds: 1),
                  child: Hero(
                    tag: "playlistImage",
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular((headerHeightOffset * 0.3)
                              .clamp(0, 40)
                              .toDouble()),
                          bottomRight: Radius.circular(
                              (headerHeightOffset * 0.3)
                                  .clamp(0, 40)
                                  .toDouble())),
                      child: Image.asset(
                        "assets/images/playlist01.jpg",
                        height: ((MediaQuery.of(context).size.height * 0.4) -
                                headerHeightOffset)
                            .clamp(MediaQuery.of(context).size.height * 0.15,
                                MediaQuery.of(context).size.height * 0.4),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50 - (headerHeightOffset * 0.1),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: ((MediaQuery.of(context).size.height * 0.4) -
                      headerHeightOffset)
                  .clamp(MediaQuery.of(context).size.height * 0.15,
                      MediaQuery.of(context).size.height * 0.4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        (headerHeightOffset * 0.3).clamp(0, 40).toDouble()),
                    bottomRight: Radius.circular(
                        (headerHeightOffset * 0.3).clamp(0, 40).toDouble())),
                color: CustomColors.pink
                    .withOpacity((headerHeightOffset * 0.0015).clamp(0, 0.3)),
              ),
            ),
            Positioned(
              bottom:
                  (50 + (headerHeightOffset * 0.1)).clamp(50, 75).toDouble(),
              left: (10 + (headerHeightOffset * 0.3)).clamp(10, 500),
              child: Container(
                  child: Hero(
                tag: "playlistName",
                transitionOnUserGestures: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "A Synthwave Mix",
                    style: TextStyle(
                        fontSize: (35 - (headerHeightOffset * 0.1))
                            .clamp(25, 35)
                            .toDouble(),
                        color: Colors.white),
                  ),
                ),
              )),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              bottom: 20 - (headerHeightOffset * 0.09),
              right: (MediaQuery.of(context).size.height * 0.4 -
                          headerHeightOffset) >
                      MediaQuery.of(context).size.height * 0.2
                  ? 10
                  : 50,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: (MediaQuery.of(context).size.height * 0.4 -
                            headerHeightOffset) >
                        MediaQuery.of(context).size.height * 0.2
                    ? 60
                    : 0,
                height: (MediaQuery.of(context).size.height * 0.4 -
                            headerHeightOffset) >
                        MediaQuery.of(context).size.height * 0.2
                    ? 60
                    : 0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.pink,
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: (MediaQuery.of(context).size.height * 0.4 -
                              headerHeightOffset) >
                          MediaQuery.of(context).size.height * 0.2
                      ? 30
                      : 0,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
                bottom:
                    (5 + (headerHeightOffset * 0.3)).clamp(5, 55).toDouble(),
                left: (10 + (headerHeightOffset * 0.3)).clamp(10, 500),
                child: Hero(
                  tag: "playlistSongsNbr",
                  transitionOnUserGestures: true,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      "50 songs",
                      style: TextStyle(
                          fontSize: 15,
                          color: ((MediaQuery.of(context).size.height * 0.4) -
                                      headerHeightOffset) >
                                  (MediaQuery.of(context).size.height * 0.3)
                              ? CustomColors.purpleLight02
                              : Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.mmaxExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => this.mminExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
