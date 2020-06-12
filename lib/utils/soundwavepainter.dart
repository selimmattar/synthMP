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
    _indexStep = _data.length ~/ _numberOfUnits;
  }
  @override
  void paint(Canvas canvas, Size size) {
    int step = _numberOfUnits ~/ 2;
    double xCenter = size.width / 2;
    double yCenter = size.height / 2;
    double value;
    /*= _data[0].toDouble() * 1.2;

    double xStart = xCenter + _circleSize * cos((pi / step));
    double yStart = yCenter + _circleSize * sin((pi / step));
    double xDest = (xStart) * (cos((pi / step)) + 1) +
        (xStart - value) * cos((pi / step) + pi);

    double yDest = (yStart) * (sin((pi / step)) + 1) +
        (yStart - value) * sin((pi / step) + pi);

    canvas.drawLine(Offset(xStart, yStart), Offset(xDest, yDest), _paint);*/
    for (int i = 1; i <= _numberOfUnits; i++) {
      value = _data[i - 1].toDouble() * _fraction;

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
