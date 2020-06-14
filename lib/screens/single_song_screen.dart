import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synthMP/constants/customcolors.dart';
import 'package:synthMP/utils/soundwavepainter.dart';

class SingleSongScreen extends StatefulWidget {
  @override
  _SingleSongScreenState createState() => _SingleSongScreenState();
}

class _SingleSongScreenState extends State<SingleSongScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  double _fraction = 0;
  static const batteryChannel =
      const MethodChannel('com.example.synthMP/battery');
  static const visualizerChannel = const EventChannel("visualizerStream");
  String _batteryPercentage = 'Unknown battery level.';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initializing state");

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150))
          ..repeat(reverse: true);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        /*setState(() {
          _fraction = animation.value;
        });*/
      });
  }

  Future<void> _getBatteryInformation() async {
    String batteryPercentage;
    try {
      var result = await batteryChannel.invokeMethod(
          'getBatteryLevel', <String, String>{
        'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3'
      });
      batteryPercentage = 'Battery level at $result%';
    } on PlatformException catch (e) {
      batteryPercentage = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryPercentage = batteryPercentage;
    });
  }

  Stream<dynamic> _getvisualizerData() {
    return visualizerChannel.receiveBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    print("------widget rebuild---------");
    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                _getBatteryInformation();
              },
              child: Text(
                "battery : " + _batteryPercentage,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            StreamBuilder(
                stream: _getvisualizerData(),
                builder: (context, snapshot) {
                  dynamic data = List.filled(8, 0);

                  if (snapshot.hasData) data = snapshot.data;

                  print(data.toString());
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: 300,
                        color: Colors.transparent,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 50,
                              bottom: 50,
                              left: 50,
                              right: 50,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/playlist01.jpg",
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: 300,
                              child: CustomPaint(
                                painter: SoundWavePainter(data, 128, 120, 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
