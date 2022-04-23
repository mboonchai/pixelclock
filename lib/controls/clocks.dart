import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pixelclock/config.dart';
import 'package:pixelclock/control.dart';

import '../pixels/alphanum_s.dart';

const H = 7;
const W = 28; //SHORT 17

class ClockS implements Control {
  late List<List<Color>> pixels;

  ClockS() {
    clear();
  }

  @override
  int get freq => kFreq1s; //nextframe every second...

  @override
  void nextFrame() {
    DateTime now = DateTime.now();
    var hour = now.hour;
    var min = now.minute;
    var second = now.second;

    var glyphs = <String>[];

    if (hour >= 10) {
      glyphs.add((hour / 10).floor().toString());
      glyphs.add((hour % 10).floor().toString());
    } else {
      glyphs.add("0");
      glyphs.add(hour.toString());
    }

    glyphs.add(":");

    if (min >= 10) {
      glyphs.add((min / 10).floor().toString());
      glyphs.add((min % 10).toString());
    } else {
      glyphs.add("0");
      glyphs.add(min.toString());
    }

    glyphs.add(":");

    if (second >= 10) {
      glyphs.add((second / 10).floor().toString());
      glyphs.add((second % 10).toString());
    } else {
      glyphs.add("0");
      glyphs.add(second.toString());
    }

    clear();
    //pixels[counter][0] = Colors.red;

    for (var y = 0; y < H; y++) {
      pixels[y] = [
        ...alphanum[glyphs[0]]![y],
        ...alphanum[glyphs[1]]![y],
        ...alphanum[glyphs[2]]![y],
        ...alphanum[glyphs[3]]![y],
        ...alphanum[glyphs[4]]![y],
        ...alphanum[glyphs[5]]![y],
        ...alphanum[glyphs[6]]![y],
        ...alphanum[glyphs[7]]![y],
      ]
          .expand<Color>((e) => {e == 1 ? Colors.white : Colors.black})
          .toList(growable: false);
    }
  }

  @override
  Color pixel(int x, int y) {
    // print(" ${x} , ${y} $size");

    if (kRotate90) {
      return pixels[H - x - 1][y];
    }
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
