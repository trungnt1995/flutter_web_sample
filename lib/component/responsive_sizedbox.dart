import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveSizedbox extends StatelessWidget {

final double height;
final double width;
final double minScale;


ResponsiveSizedbox({ Key? key,  this.height = 0,  this.width = 0, this.minScale = 0.7}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var scale = max(MediaQuery.of(context).size.width / 1920, minScale);
    return SizedBox(
      height: scale * height,
      width: scale * width,
    );
  }
}