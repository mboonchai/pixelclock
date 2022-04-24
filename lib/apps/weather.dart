import 'package:flutter/material.dart';
import 'package:pixelclock/config.dart';
import 'package:pixelclock/control.dart';
import 'package:pixelclock/controls/icons.dart';
import 'package:pixelclock/controls/texts.dart';
import 'package:pixelclock/pixels/night_cloudy.dart';

import 'basic.dart';


class WeatherApp extends BasicApp {
  
  late IconS _icon;
  late TextS _text;
  
  DateTime dtLastFetchData = DateTime.fromMillisecondsSinceEpoch(0);
  String weatherIcon = "";
  String weatherDegree = "30.2";

  WeatherApp() {
    _icon = IconS(night_cloudy, kFreq250ms);
    _text = TextS("");
    
    addControl(_icon, offsetR(const Offset(1, 1)));
    addControl(_text, offsetR(const Offset(11, 1)));
  }

 
   @override
   void nextFrame(int counter) {

     if(DateTime.now().subtract(const Duration(minutes: 10)).isAfter(dtLastFetchData)) {
        //do fetch weather data
        fetchWeather();
     }

     super.nextFrame(counter);
  }

  void fetchWeather() {

    _text.setMessage(" " + weatherDegree + "\u009A°C");

    dtLastFetchData = DateTime.now();
  }
}
