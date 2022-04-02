import 'package:flutter/material.dart';
import 'package:pixelclock/control.dart';

const H = 7;
const W = 63;

class Clock1 implements Control {

  late List<List<Color>> pixels;

  Clock1() {
    pixels = List.generate((H), (i) => List.generate( (W),(j) => Colors.black, growable: false), growable: false);

  }



  @override
  void nextFrame() {
     DateTime now = DateTime.now();
     var hour = now.hour;
     var min = now.minute;
     var second = now.second;

     var glyphs = <String>[];

     if(hour>=10) {
       glyphs.add((hour/10).floor().toString());
       glyphs.add( (hour%10).floor().toString());
     } else {
       glyphs.add("0");
       glyphs.add(hour.toString());
     }

      glyphs.add(":");
    
    if(min>=10) {
       glyphs.add((min/10).floor().toString());
       glyphs.add( (min%10).toString());
     } else {
       glyphs.add("0");
       glyphs.add(min.toString());
     }

     glyphs.add(":");

      if(second>=10) {
       glyphs.add((second/10).floor().toString());
       glyphs.add( (second%10).toString());
     } else {
       glyphs.add("0");
       glyphs.add(second.toString());
     }

    clear();
    //pixels[counter][0] = Colors.red;
    for(var y=0;y<H;y++) {
        pixels[y] = [  ...numbers[glyphs[0]]![y],
                       ...numbers[glyphs[1]]![y],
                       ...numbers[glyphs[2]]![y],
                       ...numbers[glyphs[3]]![y],
                       ...numbers[glyphs[4]]![y],
                       ...numbers[glyphs[5]]![y],
                       ...numbers[glyphs[6]]![y],
                       ...numbers[glyphs[7]]![y],
                    ].expand<Color>((e) => {
          e==1?Colors.red:Colors.black 
        }).toList(growable: false);

    }

  }

  @override
  Color pixel(int x, int y) {
    return pixels[y][x];
  }

  @override
  Size get size => Size(W.toDouble(),H.toDouble());


   void clear () {
    pixels = List.generate((H), (i) => List.generate( (W),(j) => Colors.black, growable: false), growable: false);
  }

  

  @override
  int get freq => kFreq1s;
 
  final Map<String,List<List<int>>> numbers = {
    "-" : [ [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
        ],
    "1" : [ [0,1,1,1,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0],
            [0,1,1,1,1,1,1,1,0],
        ],
    "2" : [ [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,1,1,1,1,1,1,0],
        ],
    "3" : [ [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ],        
    "4" : [ [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
        ],        
    "5" : [ [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ],
    "6" : [ [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,0,0,0,0,0,0,0],
            [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ], 
    "7" : [ [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
        ],  
     "8" :[ [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ],                            
     "9" :[ [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,0,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ],  
     "0" :[ [0,1,1,1,1,1,1,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,0,0,0,0,0,1,0],
            [0,1,1,1,1,1,1,1,0],
        ],     
     ":": [ [0,0,0],
            [0,1,0],
            [0,1,0],
            [0,0,0],
            [0,1,0],
            [0,1,0],
            [0,0,0],
        ],
  };

}
       