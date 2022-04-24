import 'dart:async';

import 'package:flutter/material.dart';

import 'control.dart';
import 'config.dart';
import 'apps/base.dart';

class Framer {
  static Framer? _instance;
  Framer._();
  factory Framer() => _instance ??= Framer._();

  int counter = 0;


  final List<App> _sets = [];
  int _activeSet = -1;

  Framer addApp(App set) {
    _sets.add(set);
    return this;
  }

  void start() {
    //EACH TICK = 125
    const duration = Duration(milliseconds: 125);

    if(_sets.isNotEmpty) {
      _activeSet = 0;
    }

    int counter = 0;
    _nextFrame(counter);
    Timer.periodic(duration, (timer) {
      counter = (counter + kFreq125ms) % 40; //count max 5 second..., why 40..?
      _nextFrame(counter);
    });
  }

  Color pixel(int x, int y) {

    if(_sets.length <= _activeSet) {
      return kColorBG;
    }

    return _sets[_activeSet].pixel(x, y);
  }

  void _nextFrame(int counter) {
    if(_sets.length > _activeSet) {
        _sets[_activeSet].nextFrame(counter);
    }
  }

  void nextSet() {
    if(_sets.isNotEmpty) {
      _activeSet = (_activeSet+1)%_sets.length;

    }    
  }

   void prevSet() {
    if(_sets.isNotEmpty) {
      _activeSet = (_sets.length+_activeSet-1)%_sets.length;

    }    
  }
}
