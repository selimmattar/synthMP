import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthMP/constants/customcolors.dart';

class PlaylistPersistentHeader extends SliverPersistentHeaderDelegate {
  PlaylistPersistentHeader({this.mmaxExtent, this.mminExtent});
  final double mmaxExtent;
  final double mminExtent;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Column(
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
          style: TextStyle(fontSize: 15, color: CustomColors.purpleLight02),
        )),
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
    // TODO: implement shouldRebuild
  }
}
