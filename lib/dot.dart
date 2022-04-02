import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

import 'framer.dart';


//Dot: one dot of the screen, bad performance --> use [Plate] instead
class Dot extends NodeWithSize {
  int posX;
  int posY;
  Color color = Colors.black;

  Dot(this.posX,this.posY,Size size) : super(size);

  @override
  void paint(Canvas canvas) {

    canvas.save();
    applyTransformForPivot(canvas);
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        Paint()..color = color );

    //TODO: Draw Shadow

    canvas.restore();
  }

    @override
  update(double dt) {
    color = Framer().pixel(posX,posY);
  }

}
