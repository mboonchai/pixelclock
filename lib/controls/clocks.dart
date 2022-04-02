import 'package:flutter/material.dart';
import 'package:pixelclock/control.dart';

import '../pixels/alphanum_s.dart';

const H = 7;
const W = 27; //SHORT 17

class ClockS implements Control {

  late List<List<Color>> pixels;

  ClockS() {
    pixels = List.generate((H), (i) => List.generate( (W),(j) => Colors.black, growable: false), growable: false);

  }

  @override
  int get freq => kFreq1s;  //nextframe every second...

  @override
  void nextFrame() {
     DateTime now = DateTime.now();
     var hour = now.hour;
     var min = now.minute;
     var second = now.second;

     var glyphs = <String>[];

     if(hour>=10) {
       glyphs.add((hour/10).floor().toString());
       glyphs.add( (hour%10).floor().toString());
     } else {
       glyphs.add("0");
       glyphs.add(hour.toString());
     }

      glyphs.add(":");
    
    if(min>=10) {
       glyphs.add((min/10).floor().toString());
       glyphs.add( (min%10).toString());
     } else {
       glyphs.add("0");
       glyphs.add(min.toString());
     }

     glyphs.add(":");

      if(second>=10) {
       glyphs.add((second/10).floor().toString());
       glyphs.add( (second%10).toString());
     } else {
       glyphs.add("0");
       glyphs.add(second.toString());
     }

    clear();
    //pixels[counter][0] = Colors.red;
    for(var y=0;y<H;y++) {
        pixels[y] = [  ...alphanum[glyphs[0]]![y],
                       ...alphanum[glyphs[1]]![y],
                       ...alphanum[glyphs[2]]![y],
                       ...alphanum[glyphs[3]]![y],
                       ...alphanum[glyphs[4]]![y],
                       ...alphanum[glyphs[5]]![y],
                       ...alphanum[glyphs[6]]![y],
                       ...alphanum[glyphs[7]]![y],
                    ].expand<Color>((e) => {
          e==1?Colors.white:Colors.black 
        }).toList(growable: false);

    }

  }

  @override
  Color pixel(int x, int y) {
    return pixels[y][x];
  }

  @override
  Size get size => Size(W.toDouble(),H.toDouble());


   void clear () {
    pixels = List.generate((H), (i) => List.generate( (W),(j) => Colors.black, growable: false), growable: false);
  }

  
       
 
}