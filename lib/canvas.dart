import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';

import 'dot.dart';

  const kCanvasW = 192.0;
  const kCanvasH = 48.0;
  const kPixelSZ = 2.0;
  const kOffset = 0.4;

class Canvas extends StatefulWidget {
  const Canvas({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CanvasState();
}

class CanvasState extends State<Canvas> {
  late NodeWithSize rootNode;
  late List<List<NodeWithSize>> dots; 


  @override
  void initState() {
    super.initState();
    rootNode = NodeWithSize(const Size(kCanvasW, kCanvasH));

    dots = <List<NodeWithSize>>[];
    var x =0;
    var y = 0;

     for(var i=0.0;i<kCanvasW;i+=(kPixelSZ+kOffset)) {

       var dary = <NodeWithSize>[];

      for(var j=0.0;j<kCanvasH;j+=(kPixelSZ+kOffset)) {
            var dot = Dot(x,y, const Size(kPixelSZ,kPixelSZ), Colors.white);
            dot.position = Offset(i, j);
            dary.add(dot);
            rootNode.addChild(dot);
            ++y;
      }

      dots.add(dary);
      ++x;
    }

  }

  @override
  Widget build(BuildContext context) {

   

    

    return Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
            child: AspectRatio(aspectRatio: 4, child: SpriteWidget(rootNode))));
  }
}
