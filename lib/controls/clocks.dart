import 'package:flutter/material.dart';
import 'package:pixelclock/control.dart';

import '../pixels/alphanum_s.dart';

const H = 7;
const W = 28; //SHORT 17

class ClockS extends  BaseControl {

  final bool showSecond;
  final bool useTicker;


  ClockS({this.showSecond=false,this.useTicker = false}): super(W, H, kFreq1s);

  @override
  void nextFrame() {
    DateTime now = DateTime.now();
    var hour = now.hour;
    var min = now.minute;
    var second = now.second;

    var ticker = useTicker?(second%2==1):true; //tick on odd number

    var glyphs = <String>[];

    //ADD PADDING 4 pixels
    if(!showSecond) {
      glyphs.add("\u009B");
    }


    if (hour >= 10) {
      glyphs.add((hour / 10).floor().toString());
      glyphs.add((hour % 10).floor().toString());
    } else {
      glyphs.add("0");
      glyphs.add(hour.toString());
    }

    glyphs.add(ticker?":":"\u009A");

    if (min >= 10) {
      glyphs.add((min / 10).floor().toString());
      glyphs.add((min % 10).toString());
    } else {
      glyphs.add("0");
      glyphs.add(min.toString());
    }

    if(showSecond) {
      glyphs.add(ticker?":":"\u009A");
      if (second >= 10) {
        glyphs.add((second / 10).floor().toString());
        glyphs.add((second % 10).toString());
      } else {
        glyphs.add("0");
        glyphs.add(second.toString());
      }
    } else {
      //ADD PADDING 4 pixels
      glyphs.add("\u009B");
      glyphs.add("\u009A");
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

}
