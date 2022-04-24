import 'package:flutter/material.dart';

import '../config.dart';
import '../control.dart';
import 'base.dart';

class BasicApp implements App {
  final int _row = (canvasWR() / (kPixelSZ + kOffset)).floor();
  final int _col = (canvasHR() / (kPixelSZ + kOffset)).floor();

  final List<Slot> _slots = [];

  BasicApp();

  BasicApp addControl(Control ctrl, Offset pos) {
    _slots.add(Slot(
        ctrl,
        kRotate90
            ? Rect.fromLTWH(_row - ctrl.size.width - pos.dx, pos.dy,
                ctrl.size.width, ctrl.size.height)
            : Rect.fromLTWH(
                pos.dx, pos.dy, ctrl.size.width, ctrl.size.height)));

    return this;
  }


   @override
  Color pixel(int x, int y) {
    for (var i = 0; i < _slots.length; ++i) {
      var s = _slots[i];
      //print("slot area: ${s.area}");
      if (s.area.contains(Offset(x.toDouble(), y.toDouble()))) {
        var pix = s.ctrl
            .pixel((x - s.area.left).floor(), (y - s.area.top).floor());


        if(kUseBGColorOffset && pix.opacity>0 && (pix.blue < kBGColorOffset &&pix.red < kBGColorOffset &&pix.green < kBGColorOffset )) {
          return kColorBG;
        }

        return pix;
      }
    }

    return kColorBG;
  }

   @override
   void nextFrame(int counter) {
    for (var i = 0; i < _slots.length; ++i) {
      if ((counter / _slots[i].ctrl.freq) ==
          (counter / _slots[i].ctrl.freq).floor()) {
        _slots[i].ctrl.nextFrame();
      }
    }
  }
}
