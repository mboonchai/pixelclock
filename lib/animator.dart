

import 'package:flutter/material.dart';

abstract class Animator {
  Size get size;
  void nextFrame();
  Color pixel(int x, int y);
  
} 