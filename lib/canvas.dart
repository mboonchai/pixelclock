import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:spritewidget/spritewidget.dart';
import 'config.dart';
import 'plate.dart';


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


     for(var i=0.0;i<kCanvasW;i+=(kPixelSZ+kOffset)*kPlateW) {
       var dary = <NodeWithSize>[];
      y=0;
      for(var j=0.0;j<kCanvasH-(kPixelSZ+kOffset);j+=(kPixelSZ+kOffset)*kPlateH) {
            var dot = Plate(x,y,kPlateW,kPlateH, const Size((kPixelSZ+kOffset)*kPlateW,(kPixelSZ+kOffset)*kPlateH));
            dot.position = Offset(i, j);
            dary.add(dot);
            rootNode.addChild(dot);
            y+=kPlateH;
      }

      dots.add(dary);
      x+=kPlateW;
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
