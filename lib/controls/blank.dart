


import 'package:pixelclock/control.dart';

class Blank extends  BaseControl {

  final int width;
  final int height;


  Blank(this.width,this.height): super(width,height, kFreq5s);


  @override
  void nextFrame() {
   
  }



}
