


import 'package:flutter/material.dart';
import 'package:pixelclock/apps/basic.dart';
import 'package:pixelclock/config.dart';
import 'package:pixelclock/control.dart';
import 'package:pixelclock/controls/icons.dart';
import 'package:pixelclock/controls/text_static.dart';
import 'package:pixelclock/pixels/calendar/date_frame.dart';

class CalendarClock extends BasicApp {
  
  late IconS _icon;
  late TextStatic _text;
  
  DateTime dtLastFetchData = DateTime.fromMillisecondsSinceEpoch(0);
  String weatherIcon = "";
  String weatherDegree = "30.2";

  CalendarClock() {
    _icon = IconS(calendarDateFrame, kFreq1s,height: 10,width: 11);
    _text = TextStatic("\u009A8\u009A",7,height: 6,textColor: Colors.black87,bgColor: Colors.white);

    addControl(_text, offsetR(const Offset(2, 2)));
    addControl(_icon, offsetR(const Offset(0, 0)));
  }
 
   @override
   void nextFrame(int counter) {

     if(DateTime.now().subtract(const Duration(minutes: 10)).isAfter(dtLastFetchData)) {
        //do fetch weather data
        setDate();
     }

     super.nextFrame(counter);
  }

  void setDate() {

    dtLastFetchData = DateTime.now();
  }
}
