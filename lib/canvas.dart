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

    rootNode = NodeWithSize(Size(canvasWR(), canvasHR()));

    dots = <List<NodeWithSize>>[];
    var x = 0;
    var y = 0;

    for (var i = 0.0; i < canvasWR(); i += (kPixelSZ + kOffset) * plateWR()) {
      var dary = <NodeWithSize>[];
      y = 0;
      for (var j = 0.0;
          j < canvasHR() - (kPixelSZ + kOffset);
          j += (kPixelSZ + kOffset) * plateHR()) {
        var dot = Plate(
            x,
            y,
            plateWR(),
            plateHR(),
            Size((kPixelSZ + kOffset) * plateWR(),
                (kPixelSZ + kOffset) * plateHR()));
        dot.position = Offset(i, j);
        dary.add(dot);
        rootNode.addChild(dot);
        y += plateHR();
      }

      dots.add(dary);
      x += plateWR();
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
