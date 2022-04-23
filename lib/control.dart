

import 'package:flutter/material.dart';
import 'config.dart';


const kFreq125ms = 1;
const kFreq250ms = 2;
const kFreq500ms = 4;
const kFreq1s = 8;
const kFreq2s = 16;
const kFreq5s = 40;

//Control: return pixel color data for each frame..
abstract class Control {
  Size get size;
  void nextFrame();
  Color pixel(int x, int y);
  int get freq; //Framer will call next frame depent on freq..
} 


abstract class BaseControl implements Control {
  final int _width;
  final int _height;
  final int _freq;
  late List<List<Color>> pixels;

  BaseControl(this._width, this._height,this._freq) {

    clear();
  }

  @override
  int get freq => _freq;

  @override
  Size get size => sizeR(Size(_width.toDouble(), _height.toDouble()));


  @override
  Color pixel(int x, int y) {
    if (kRotate90) return pixels[_height - x - 1][y];
    return pixels[y][x];
  }



  void clear() {
    var sz = Size(_width.toDouble(), _height.toDouble());

    pixels = List.generate(
        (sz.height.toInt()),
        (i) => List.generate((sz.width.toInt()), (j) => Colors.black,
            growable: false),
        growable: false);
  }
  
  
}

