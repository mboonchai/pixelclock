import 'dart:async';

import 'package:flutter/material.dart';

import 'control.dart';
import 'config.dart';

class Framer {
 static Framer? _instance;
  Framer._() {
    init();
  }
  factory Framer() =>  _instance??=Framer._();

  //////////////////////

  List<Slot> slots = [];
  late List<List<Color>> pixels;
  int counter = 0;
  
 
  void init() {
    var row = (kCanvasW/(kPixelSZ+kOffset)).floor();
    var col = (kCanvasH/(kPixelSZ+kOffset)).floor();

    pixels = List.generate((row), (i) => List.generate( (col),(j) => Colors.black, growable: false), growable: false);

  }

void start() {

  //EACH TICK = 125
  const duration = Duration(milliseconds: 125);

  int counter = 0;
  Timer.periodic(duration, (timer) {
    counter = (counter+kFreq125ms)%40;  //count max 5 second...
    nextFrame(counter);
  });



}


  void addControl(Control ctrl,Offset pos) {
    slots.add(Slot(ctrl,Rect.fromLTWH(pos.dx, pos.dy, ctrl.size.width, ctrl.size.height)));
  }
  Color pixel(int x, int y) {

    for(var i=0; i < slots.length; ++i) {
      var s = slots[i];
      if(s.area.contains(Offset(x.toDouble(),y.toDouble()))) {
        return s.ctrl.pixel( (x-s.area.left).floor(),(y-s.area.top).floor() );
      }
    }


    return pixels[x][y];
  }


  void nextFrame(int counter) {
        for(var i=0; i < slots.length; ++i) {

          if( (counter/slots[i].ctrl.freq) == (counter/slots[i].ctrl.freq).floor()  ) {
            slots[i].ctrl.nextFrame();
          }
          
        }
  }



}

class Slot {
  Control ctrl;
  Rect area;

  Slot(this.ctrl,this.area);
}