import 'package:flutter/widgets.dart';
import 'package:pixelclock/control.dart';
import 'package:pixelclock/framer.dart';
import 'package:pixelclock/pixels/rocket.dart';
import 'config.dart';
import 'controls/clocks.dart';
import 'controls/icons.dart';
import 'controls/texts.dart';
import 'canvas.dart';
import 'pixels/basketball.dart';
import 'pixels/beer.dart';
import 'pixels/link2.dart';
import 'pixels/sunny.dart';

void main() {
  final framer = Framer();
  framer.addControl(ClockS(), offsetR(const Offset(12, 1)));
  framer.addControl(IconS(links2, kFreq250ms), offsetR(const Offset(2, 1)));
  //framer.addControl(IconS(basketball,kFreq125ms), const Offset(11,1));
  //framer.addControl(IconS(rocket,kFreq125ms), const Offset(20,1));
  //framer.addControl(IconS(beer,kFreq125ms), const Offset(29,1));

  //framer.addControl(TextS("Pack my box with five (dozen) liquor jugs. \\/01234567890:°\$,."), const Offset(0,1));
  framer.start();

  runApp(const Canvas());
}
