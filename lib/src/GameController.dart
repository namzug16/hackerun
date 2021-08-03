import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackerun/src/Player/PlayerController.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameController extends StateNotifier<bool> {
  GameController(this.read) : super(false);

  final Reader read;

  late final PlayerController _player;

  void init(Size size) {
    _player = read(playerProvider.notifier);
    _player.init(size);
  }


  /// Colors;
  ///rgb(17, 17, 17); dark
  ///186 186 light
  ///33 210 246 blue
  void renderGame(Canvas c, x) {
    c.drawPaint(Paint()..color=Color.fromRGBO(186, 186, 186, 1));
    _player.renderPlayer(c, x);
    // _player.renderHitBox(c);
    // _player.renderState(c);

  }
}

final gameProvider = StateNotifierProvider<GameController, bool>(
    (ref) => GameController(ref.read));
