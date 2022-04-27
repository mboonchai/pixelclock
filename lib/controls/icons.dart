import 'package:flutter/material.dart';
import 'package:pixelclock/control.dart';
import '../config.dart';


class IconS extends BaseControl {

  //for animation
  int _frame = 0;
  List<List<List<int>>> data;
  late List<int> _frameControls;

  late int height;
  late int width;

  IconS(this.data,int freq,{List<int> animationFrameCfg = const[],this.height = 8, this.width = 8}): super(width, height, freq) {
    clear();

    print(data.length);

    _buildFrameControl(animationFrameCfg);

  }

  void _buildFrameControl(List<int> cfg) {
      if (cfg.isEmpty) {
        //no frame control --> use default
        _frameControls =List.generate(data.length, (index) => index,growable: false);
      } else {

        _frameControls = [];
        for(var i=0;i<cfg.length;++i) {
          for(var j=0;j<cfg[i];++j) {
            _frameControls.add(i);
          }
        }
      }
  }


  @override
  void nextFrame() {
    clear();

    for (var y = 0; y < height; y++) {
      pixels[y] = data[_frameControls[_frame]][y]
          .expand<Color>((e) => {e == 0x00000000 ? kColorBG : Color(e)})
          .toList(growable: false);
    }

    _frame = (_frame + 1) % _frameControls.length;
  }

}
