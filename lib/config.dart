
  import 'dart:ui';

const kDebugMode = true;

  //  TOTAL PIXEL = kCanvasW/(kPixelSZ+kOffset) * kCanvasH/(kPixelSZ+kOffset)
  //              = 40 x 10

  const kCanvasW = 192.0;
  const kCanvasH = 48.0;
  
  //PIXEL SIZE
  const kPixelSZ = 4.0;     
  //SPACE BETWEEN EACH PIXEL
  const kOffset = 0.8;

  //PLATE SIZE
  const kPlateW = 10;
  const kPlateH = 10;


  const kColorBG = Color(0xFF000000);

//FOR SHADOW
  const kBlurValue = 0.6;