

import 'package:flutter/material.dart';


//Control: return pixel color data for each frame..
abstract class Control {
  Size get size;
  void nextFrame();
  Color pixel(int x, int y);
  int get freq; //Framer will call next frame depent on freq..
} 

const kFreq125ms = 1;
const kFreq250ms = 2;
const kFreq500ms = 4;
const kFreq1s = 8;
const kFreq2s = 16;
const kFreq5s = 40;
