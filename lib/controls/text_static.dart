import 'package:flutter/material.dart';
import 'package:pixelclock/config.dart';
import 'package:pixelclock/control.dart';

import '../pixels/alphanum_s.dart';

class TextStatic extends  BaseControl {
  String message;
  //message total pixel w
  int messagePixW = 0;

  int width;
  int height;

  Color textColor;
  Color bgColor;

  TextStatic(this.message,this.width,{this.height=7,this.textColor=Colors.white,this.bgColor=kColorBG}): super(width, height, kFreq250ms) {
    setMessage(message);
  }

  @override
  void nextFrame() {
    
    //do nothig
 

  }

 

  void setMessage(String msg) {
    message = msg.toUpperCase();

     messagePixW = 0;
    for (var i = 0; i < message.length; ++i) {
      messagePixW += alphanum[message[i]]![0].length;
    }

       for (var y = 0; y < height; y++) {
      var framex = <int>[];

      for (var x = 0; x < message.length; x++) {
          framex.addAll(alphanum[message[x]]![y]);
      }

      pixels[y] = framex
          .expand<Color>((e) => {e == 1 ? textColor : bgColor})
          .toList(growable: false);
    }

  }
}
