
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:hackerun/src/Enemies/EnemiesFramesValues.dart';

import '../GlobalVariables.dart';

class Bug{
  Bug({
    required this.fly,
    required this.sprite,
    required this.posX,
    required this.vel,
    required this.isDark,
    required this.size,
});

  final bool fly;
  final Image sprite;
  final double posX;
  final double vel;
  final bool isDark;
  final Size size;

  bool? get d => _isDarkOnCreated;
  bool? _isDarkOnCreated = false;

  bool get shouldBeDeleted => _shouldBeDeleted;
  bool _shouldBeDeleted = false;

  Rect get hitBox => _getHitBox();

  int _frame = 0;
  int _frameCount = 0;

  Offset? get pos => _position;
  Offset? _position;

  void renderBug(Canvas c) {
    bool dark = _isDarkOnCreated ?? isDark;
    if (_position == null)
      _position = Offset(
          posX,
          size.height -
              maxSizeFloor -
              (fly ? 80 * scaleFactor : 16*scaleFactor));
    final List<int> v = fly ? framesValuesBugs[1] : framesValuesBugs[0];
    final int amountFrames = !fly ? framesValuesBugs[1].length : framesValuesBugs[0].length;
    final int fc = 60 ~/ v[0];
    _frameCount++;
    if (_frameCount == fc) {
      if (_frame < amountFrames) _frame++;
      if (v[1] == 1 && _frame == amountFrames) {
        _frame = 0;
      } else if (v[1] == 0 && _frame == amountFrames) {
        _frame = amountFrames - 1;
      }
      _frameCount = 0;
    }

    if (_position!.dx > -16 * scaleFactor) {
      _move();
    } else {
      _shouldBeDeleted = true;
    }

    c.save();
    c.translate(_position!.dx, _position!.dy);
    c.scale(scaleFactor);
    c.drawImageRect(
        sprite,
        Rect.fromLTWH(
            !fly
                ? spritesBugs[0][_frame].dx
                : spritesBugs[1][_frame].dx,
            !fly
                ? spritesBugs[0][_frame].dy
                : spritesBugs[1][_frame].dy + (!dark ? 96 : 0),
            16,
            16),
        Rect.fromLTWH(0, 0, 16, 16),
        Paint());
    c.restore();
    // c.drawRect(hitBox, Paint()..color=Colors.blueAccent.withOpacity(0.3));
  }

  void setDark() {
    if(_isDarkOnCreated == null){
      _isDarkOnCreated = !isDark;
    }else{
      _isDarkOnCreated = !_isDarkOnCreated!;
    }
  }

  void stop(){
    _stop= true;
  }

  bool _stop = false;
  void _move() {
    _position = _position! - Offset(!_stop ? vel : 0, 0);
  }

  Rect _getHitBox() {
    return Offset(_position!.dx, _position!.dy + 8*scaleFactor) &
    Size(16*scaleFactor, 6*scaleFactor);
  }
}