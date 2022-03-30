// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';

import 'framer.dart';

class Dot extends NodeWithSize {
  int pX;
  int pY;
  Color color = Colors.black;

  Dot(this.pX,this.pY,Size size) : super(size);

  @override
  void paint(Canvas canvas) {

    canvas.save();
    applyTransformForPivot(canvas);
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        Paint()..color = color );

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0,size.height+0.3);
    path.lineTo(0.3,size.height+0.3);
    path.lineTo(0.3,0.3);
    path.lineTo(size.width+0.3,0.3);
    path.lineTo(size.width+0.3,0);
    path.close();


    canvas.drawShadow(path.shift(const Offset(-0.2, -0.1)), Colors.black, 2.0, true);


    canvas.restore();
  }

    @override
  update(double dt) {
    color = Framer().pixel(pX,pY);
  }

}
