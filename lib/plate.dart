// ignore_for_file: avoid_print

import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';

import 'config.dart';
import 'framer.dart';

//Plate: contains many Dots
class Plate extends NodeWithSize {
  int posX;
  int posY;
  int nDotW;
  int nDotH;

  Plate(this.posX, this.posY, this.nDotW, this.nDotH, Size size) : super(size) {
    motions.stopAll();
    print("plate $posX $posY $nDotW $nDotH $size");
  }

  @override
  void paint(Canvas canvas) {
    canvas.save();
    applyTransformForPivot(canvas);

    Paint paint = Paint()
      ..color = kColorBG
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, kBlurValue);

    for (var x = 0; x < nDotW; ++x) {
      var dx = x * (kPixelSZ + kOffset);

      for (var y = 0; y < nDotH; ++y) {
        var dy = y * (kPixelSZ + kOffset);

        final rect = Rect.fromLTWH(dx, dy, kPixelSZ, kPixelSZ);
        final color = Framer().pixel(posX + x, posY + y);

        // print("request pixel: ${posX + x}, ${posY + y}");

        canvas.drawRect(rect, Paint()..color = color);

        

        //DRAW SHADOW
         if (kDrawShadow && color != kColorBG) {
           var path = Path.combine(
               PathOperation.difference,
               Path()
                 ..addRect(Rect.fromLTWH(dx - 4 * kOffset, dy - 4 * kOffset,
                     kPixelSZ + 4 * kOffset, kPixelSZ + 4 * kOffset)),
               Path()..addRect(rect));

           canvas.saveLayer(rect, Paint());
           canvas.clipRect(rect);
           canvas.drawPath(path, paint);
           canvas.restore();

         }


      
      }
    }

    canvas.restore();
  }

  @override
  update(double dt) {}
}
