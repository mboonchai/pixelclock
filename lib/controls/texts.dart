import 'package:flutter/material.dart';
import 'package:pixelclock/control.dart';

import '../pixels/alphanum_s.dart';

const H = 7;
const W = 40; //SAME SA LONG CLOCK...

class TextS extends  BaseControl {
  String message;
  bool scrolling = true;

  //message total pixel w
  int messagePixW = 0;

  //for animation
  int frame = 0;

  TextS(this.message,{this.scrolling=true}): super(W, H, kFreq250ms) {

    setMessage(message);
  }

  @override
  void nextFrame() {
    clear();

    var space = W-messagePixW>8?W-messagePixW:8;

    for (var y = 0; y < H; y++) {
      var framex = <int>[];

      for (var x = 0; x < message.length; x++) {
          framex.addAll(alphanum[message[x]]![y]);
      }

      //add buffer space..
      framex.addAll(List.generate(space,(j) => 0 ));

      //move frame left <<<<
      var draw = framex.skip(frame).toList();



      //fill the next 8 space with black or skip if too long...
      if(draw.length<W) {
            draw = [...draw, ...framex.take(messagePixW-draw.length)];
      }
      else if (draw.length > W) {
        draw = draw.take(W).toList();
      }
      
      

      pixels[y] = draw
          .expand<Color>((e) => {e == 1 ? Colors.white : Colors.black})
          .toList(growable: false);
    }

    //calc width of msg
    var textW = messagePixW;
    if (textW > W && scrolling) {
      //scroll...
      frame = (frame+1)%(messagePixW+space);
    }
  }

 

  void setMessage(String msg) {
    message = msg.toUpperCase();
    frame = 0;

     messagePixW = 0;
    for (var i = 0; i < message.length; ++i) {
      messagePixW += alphanum[message[i]]![0].length;
    }
  }
}
