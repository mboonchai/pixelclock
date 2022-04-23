import 'package:flutter/material.dart';

import '../config.dart';
import '../control.dart';

const H = 8;
const W = 8;

class IconS implements Control {
  late List<List<Color>> pixels;

  //for animation
  int _frame = 0;
  List<List<List<int>>> data;
  final int _freq;

  IconS(this.data, this._freq) {
    clear();
  }

  @override
  int get freq => _freq;

  @override
  void nextFrame() {
    clear();

    for (var y = 0; y < H; y++) {
      pixels[y] = data[_frame][y]
          .expand<Color>((e) => {e == 0x00000000 ? kColorBG : Color(e)})
          .toList(growable: false);
    }

    _frame = (_frame + 1) % data.length;
  }

  @override
  Color pixel(int x, int y) {
    if (kRotate90) return pixels[W - x - 1][y];
    return pixels[y][x];
  }

  @override
  Size get size => sizeR(Size(W.toDouble(), H.toDouble()));

  void clear() {
    var sz = Size(W.toDouble(), H.toDouble());

    pixels = List.generate(
        (sz.height.toInt()),
        (i) => List.generate((sz.width.toInt()), (j) => Colors.black,
            growable: false),
        growable: false);
  }
}
