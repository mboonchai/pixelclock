import 'package:flutter/material.dart';

import 'animator.dart';
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
    //num pixel x = kCanvasW/(kPixelSZ+kOffset) = 80
    //num pixel y = kCanvasH/(kPixelSZ+kOffset) = 20
    var row = (kCanvasW/(kPixelSZ+kOffset)).floor();
    var col = (kCanvasH/(kPixelSZ+kOffset)).floor();

    pixels = List.generate((row), (i) => List.generate( (col),(j) => Colors.black, growable: false), growable: false);

  }

  void addAnimator(Animator animator,Offset pos) {
    slots.add(Slot(animator,Rect.fromLTWH(pos.dx, pos.dy, animator.size.width, animator.size.height)));
  }

  void clear () {
    var row = (kCanvasW/(kPixelSZ+kOffset)).floor();
    var col = (kCanvasH/(kPixelSZ+kOffset)).floor();
    pixels = List.generate((row), (i) => List.generate( (col),(j) => Colors.black, growable: false), growable: false);
  }



  Color pixel(int x, int y) {

    for(var i=0; i < slots.length; ++i) {
      var s = slots[i];
      if(s.area.contains(Offset(x.toDouble(),y.toDouble()))) {
        return s.animator.pixel( (x-s.area.left).floor(),(y-s.area.top).floor() );
      }
    }


    return pixels[x][y];
  }


  void nextFrame() {

    // counter = (counter+1)%80;
    
    // clear();
    // pixels[counter][0] = Colors.red;
        //clear();

        for(var i=0; i < slots.length; ++i) {
          slots[i].animator.nextFrame();
        }
  }



}

class Slot {
  Animator animator;
  Rect area;

  Slot(this.animator,this.area);
}