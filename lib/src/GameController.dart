import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackerun/src/Enemies/EnemySpawnerController.dart';
import 'package:hackerun/src/GlobalVariables.dart';
import 'package:hackerun/src/Player/PlayerController.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameController extends StateNotifier<bool> {
  GameController(this.read) : super(false);

  final Reader read;

  late final PlayerController _player;
  late final EnemySpawnerController _spawner;

  void init(Size size) {
    _player = read(playerProvider.notifier);
    _spawner = read(enemySpawnerProvider.notifier);
    _player.init(size);
    _spawner.init();
  }

  /// Colors;
  ///rgb(17, 17, 17); dark
  ///186 186 light
  ///33 210 246 blue
  void renderGame(Canvas c, x) {
    c.drawPaint(Paint()
      ..color = read(darkWorldProvider)
          ? Color.fromRGBO(17, 17, 17, 1)
          : Color.fromRGBO(186, 186, 186, 1));
    _spawner.renderEnemies(c, x);
    _player.renderPlayer(c, x);
    _player.renderHitBox(c);
    // _player.renderState(c);
  }
}

final gameProvider = StateNotifierProvider<GameController, bool>(
    (ref) => GameController(ref.read));
