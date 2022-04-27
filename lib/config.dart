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

const kColorBG = Color(0xFF080808);
const kUseBGColorOffset = true;
const kBGColorOffset = 0x24;


//FOR SHADOW
const kDrawShadow = true;
const kBlurValue = 0.6;


const kRotate90 = false;

double canvasWR() {
  if (kRotate90) return kCanvasH;
  return kCanvasW;
}

double canvasHR() {
  if (kRotate90) return kCanvasW;
  return kCanvasH;
}

int plateWR() {
  if (kRotate90) return kPlateH;
  return kPlateW;
}

int plateHR() {
  if (kRotate90) return kPlateW;
  return kPlateH;
}

Rect rectR(Rect r) {
  if (kRotate90) return Rect.fromLTWH(r.top, r.left, r.height, r.width);
  return r;
}

Size sizeR(Size s) {
  if (kRotate90) return Size(s.height, s.width);
  return s;
}

Offset offsetR(Offset o) {
  if (kRotate90) return Offset(o.dy, o.dx);
  return o;
}
