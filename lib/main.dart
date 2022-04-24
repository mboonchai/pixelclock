import 'package:flutter/widgets.dart';
import 'package:pixelclock/apps/weather.dart';
import 'package:pixelclock/control.dart';
import 'package:pixelclock/framer.dart';
import 'package:pixelclock/pixels/beer.dart';
import 'package:pixelclock/pixels/link2.dart';
import 'package:pixelclock/pixels/rocket.dart';
import 'config.dart';
import 'apps/basic.dart';
import 'controls/blank.dart';
import 'controls/clocks.dart';
import 'controls/icons.dart';
import 'pixelclock.dart';
import 'pixels/tetris2.dart';

void main() {
  final framer = Framer().addApp(
    BasicApp()
      .addControl(Blank(6,10),offsetR(const Offset(0, 0)) )
      .addControl(ClockS(showSecond: true,useTicker: true), offsetR(const Offset(6, 1)))
  ).addApp(
    WeatherApp()
  ).addApp(
    BasicApp()
      .addControl(IconS(tetris2, kFreq250ms), offsetR(const Offset(1, 1)))
      .addControl(IconS(links2, kFreq250ms), offsetR(const Offset(10, 1)))
      .addControl(IconS(rocket, kFreq125ms), offsetR(const Offset(19, 1)))
      .addControl(IconS(beer, kFreq125ms), offsetR(const Offset(27, 1)))
  );
  //framer.addControl(ClockS(), offsetR(const Offset(12, 1)));
  //framer.addControl(IconS(tetris2, kFreq250ms), offsetR(const Offset(2, 1)));

  


  //framer.addControl(IconS(basketball,kFreq125ms), const Offset(11,1));
  //framer.addControl(IconS(rocket,kFreq125ms), const Offset(20,1));
  //framer.addControl(IconS(beer,kFreq125ms), const Offset(29,1));

  //framer.addControl(TextS("Pack my box with five (dozen) liquor jugs. \\/01234567890:°\$,."), const Offset(0,1));
  framer.start();

  runApp(const PixelClock());
}
