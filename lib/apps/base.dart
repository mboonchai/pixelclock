import 'package:flutter/material.dart';

import '../control.dart';

abstract class App {
  Color pixel(int x, int y);
  void nextFrame(int counter);
}

class Slot {
  Control ctrl;
  Rect area;

  Slot(this.ctrl, this.area);
}
