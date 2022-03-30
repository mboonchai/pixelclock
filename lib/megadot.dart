// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';

import 'config.dart';
import 'framer.dart';

class MegaDot extends NodeWithSize {
  int pX;
  int pY;
  int nW;
  int nH;

  MegaDot(this.pX,this.pY, this.nW, this.nH, Size size) : super(size);

  @override
  void paint(Canvas canvas) {

    canvas.save();
    applyTransformForPivot(canvas);

    for(var x=0;x<nW;++x){
      int p = 0;

      var dx = x*(kPixelSZ+kOffset);

      for(var y=0;y<nH;++y){
        var dy= y*(kPixelSZ+kOffset);

            canvas.drawRect(
        Rect.fromLTWH(dx,dy, kPixelSZ, kPixelSZ),
        Paint()..color = Framer().pixel(pX+x,pY+y) );

  // var path = Path();
  //   path.moveTo(dx,dy);
  //   path.lineTo(dx,dy+kPixelSZ+0.3);
  //   path.lineTo(dx+0.3,dy+kPixelSZ+0.3);
  //   path.lineTo(dx+0.3,dy+0.3);
  //   path.lineTo(dx+kPixelSZ+0.3,dy+0.3);
  //   path.lineTo(dx+kPixelSZ+0.3,dy);
  //   path.close();


  //   canvas.drawShadow(path.shift(const Offset(-0.2, -0.1)), Colors.black, 2.0, true);

      }
    }



  

    canvas.restore();
  }

    @override
  update(double dt) {
    
  }

}
