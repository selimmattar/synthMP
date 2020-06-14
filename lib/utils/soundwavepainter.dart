import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthMP/constants/customcolors.dart';

class SoundWavePainter extends CustomPainter {
  Paint _paint;
  static dynamic _data;
  int _numberOfUnits;
  int _circleSize;
  int _indexStep = 1;
  static dynamic _oldData = null;
  double _fraction;
  SoundWavePainter(
      dynamic data, int numberOfUnits, int circleSize, double fraction) {
    _paint = Paint()
      ..color = CustomColors.pink
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;
    _data = data != "nodata" ? data : _data;
    _fraction = fraction;
    _numberOfUnits = numberOfUnits;
    _circleSize = circleSize;
    _indexStep = _numberOfUnits ~/ _data.length;
  }
  @override
  void paint(Canvas canvas, Size size) {
    int step = _numberOfUnits ~/ 2;
    double xCenter = size.width / 2;
    double yCenter = size.height / 2;
    double value;

    for (int i = 1; i <= _numberOfUnits; i++) {
      int currIndex = (i - 1) ~/ _indexStep;

      value = _data[currIndex].toDouble() *
          pow(_fraction, ((_indexStep / 2) - (i % _indexStep)).abs() + 1);

      double xStart = xCenter + _circleSize * cos((pi / step) * i);
      double yStart = yCenter + _circleSize * sin((pi / step) * i);
      double xDest = (xStart) * (cos((pi / step) * i) + 1) +
          (xStart - value) * cos((pi / step) * i + pi);

      double yDest = (yStart) * (sin((pi / step) * i) + 1) +
          (yStart - value) * sin((pi / step) * i + pi);

      canvas.drawLine(Offset(xStart, yStart), Offset(xDest, yDest), _paint);
    }
    _oldData = _data;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
