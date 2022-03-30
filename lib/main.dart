// @dart=2.9
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:pixelclock/framer.dart';
import 'animator/clock1.dart';
import 'canvas.dart';

void main() {
  final framer = Framer();
  framer.addAnimator(Clock1(), const Offset(20,0));

  const duration = Duration(seconds: 1);
  Timer.periodic(duration, (timer) {
    framer.nextFrame();
  });

  runApp(const Canvas());
}
