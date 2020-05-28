import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synthMP/constants/customcolors.dart';

class SingleSongScreen extends StatefulWidget {
  @override
  _SingleSongScreenState createState() => _SingleSongScreenState();
}

class _SingleSongScreenState extends State<SingleSongScreen> {
  static const batteryChannel =
      const MethodChannel('com.example.synthMP/battery');
  static const visualizerChannel = const EventChannel("visualizerStream");
  String _batteryPercentage = 'Unknown battery level.';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initializing state");
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> _getBatteryInformation() async {
    String batteryPercentage;
    try {
      var result = await batteryChannel.invokeMethod(
          'getBatteryLevel', <String, String>{
        'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
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
    return Scaffold(
      backgroundColor: CustomColors.purple,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                "assets/images/playlist01.jpg",
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
              ),
            ),
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
                  if (snapshot.hasData)
                    return Text(
                      "visualizer : " + snapshot.data,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    );
                  else
                    return Text(
                      "visulaizer :  no data receiver",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    );
                })
          ],
        ),
      ),
    );
  }
}
