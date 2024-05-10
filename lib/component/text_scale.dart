import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double minTextScaleFactor = 0.8}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1920);
    return min(max(val, minTextScaleFactor), 1);
  }
}