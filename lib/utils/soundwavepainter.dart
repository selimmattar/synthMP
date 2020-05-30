import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthMP/constants/customcolors.dart';

class SoundWavePainter extends CustomPainter {
  Paint _paint;
  dynamic _data;
  int _numberOfUnits;
  int _circleSize;
  int _indexStep = 1;
  static dynamic _oldData = null;
  SoundWavePainter(dynamic data, int numberOfUnits, int circleSize) {
    _paint = Paint()
      ..color = CustomColors.pink
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;
    _data = data;
    if (_oldData == null) _oldData = _data;
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
    for (int i = 1; i <= _numberOfUnits; i++) {
      value = _data[(i - 1)] > 0 ? _data[(i - 1)].toDouble() : 0.0;

      double xStart = xCenter + _circleSize * cos((pi / step) * i);
      double yStart = yCenter + _circleSize * sin((pi / step) * i);
      double xDest = (xStart) * (cos((pi / step) * i) + 1) +
          (xStart - value * 0.07) * cos((pi / step) * i + pi);

      double yDest = (yStart) * (sin((pi / step) * i) + 1) +
          (yStart - value * 0.07) * sin((pi / step) * i + pi);

      canvas.drawLine(Offset(xStart, yStart), Offset(xDest, yDest), _paint);
    }
    _oldData = _data;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    for (int i = 1; i <= _numberOfUnits; i++) {
      if (_data[(i - 1) * _indexStep] > 0) return true;
      return false;
    }
  }
}
