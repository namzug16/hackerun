import 'dart:ui';

extension OffsetExtensions on Offset{

  Offset clamp(Offset min, Offset max){
    return Offset(dx.clamp(min.dx, max.dx), dy.clamp(min.dy, max.dy));
  }

}