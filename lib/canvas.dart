import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';
import 'config.dart';
import 'dot.dart';
import 'megadot.dart';


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

    //  for(var i=0.0;i<kCanvasW;i+=(kPixelSZ+kOffset)) {
    //    var dary = <NodeWithSize>[];
    //   y=0;
    //   for(var j=0.0;j<kCanvasH-(kPixelSZ+kOffset);j+=(kPixelSZ+kOffset)) {
    //         var dot = Dot(x,y, const Size(kPixelSZ,kPixelSZ));
    //         dot.position = Offset(i, j);
    //         dary.add(dot);
    //         rootNode.addChild(dot);
    //         ++y;
    //   }

    //   dots.add(dary);
    //   ++x;
    // }

     for(var i=0.0;i<kCanvasW;i+=(kPixelSZ+kOffset)*20) {
       var dary = <NodeWithSize>[];
      y=0;
      for(var j=0.0;j<kCanvasH-(kPixelSZ+kOffset);j+=(kPixelSZ+kOffset)*20) {
            var dot = MegaDot(x,y,20,20, const Size((kPixelSZ+kOffset)*20,(kPixelSZ+kOffset)*20));
            dot.position = Offset(i, j);
            dary.add(dot);
            rootNode.addChild(dot);
            y+=20;
      }

      dots.add(dary);
      x+=20;
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
