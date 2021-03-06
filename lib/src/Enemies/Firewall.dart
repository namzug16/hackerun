import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:hackerun/src/Enemies/EnemiesFramesValues.dart';
import 'package:hackerun/src/GlobalVariables.dart';

class Firewall {
  Firewall({
    required this.size,
    required this.lvl,
    required this.posX,
    required this.vel,
    required this.sprite,
    required this.isDark,
  });

  final int lvl;
  final Image sprite;
  final double posX;
  final double vel;
  final bool isDark;
  final Size size;

  // in case the world sets dark and an instance of
  // firewall has been already created
  bool? get d => _isDarkOnCreated;
  bool? _isDarkOnCreated;

  bool get shouldBeDeleted => _shouldBeDeleted;
  bool _shouldBeDeleted = false;

  Rect get hitBox => _getHitBox();

  int _frame = 0;
  int _frameCount = 0;

  Offset? get pos => _position;
  Offset? _position;

  void renderFirewall(Canvas c) {
    bool dark = _isDarkOnCreated ?? isDark;
    if (_position == null)
      _position = Offset(
          posX,
          size.height -
              maxSizeFloor -
              (lvl == 1 ? 48 * scaleFactor : 80 * scaleFactor));
    final List<int> v = framesValuesFirewall[0];
    final int amountFrames = 4;
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
            lvl == 1
                ? spritesFirewall[0][_frame].dx
                : spritesFirewall[1][_frame].dx,
            lvl == 1
                ? spritesFirewall[0][_frame].dy + (!dark ? 96 : 0)
                : spritesFirewall[1][_frame].dy + (!dark ? 96 : 0),
            16,
            lvl == 1 ? 48 : 96),
        Rect.fromLTWH(0, 0, 16, lvl == 1 ? 48 : 96),
        Paint());
    c.restore();
    // * hitBox
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
    _stop = true;
  }

  bool _stop = false;
  void _move() {
    _position = _position! - Offset(!_stop ? vel : 0, 0);
  }

  Rect _getHitBox() {
    return Offset(_position!.dx + 3*scaleFactor, _position!.dy + 18*scaleFactor) &
        Size(10*scaleFactor, lvl == 1 ? 32*scaleFactor : 80*scaleFactor);
  }
}
