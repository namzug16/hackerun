import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'Player.freezed.dart';

@freezed
class Player with _$Player {
  factory Player({
    @Default(Offset(300, 300)) Offset position,
    @Default(Size(100,100)) Size size,
    @Default(0.0) double velocityY,
    @Default(0.0) double velocityX,
}) = _Player;

}