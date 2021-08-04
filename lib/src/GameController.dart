import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackerun/src/Enemies/EnemySpawnerController.dart';
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

  int score = 0;

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
    _renderScore(c, x);
    if (!state && score == 0) {
      _renderStartGameButton(c, x);
    } else if (!state && score > 0) {
      _renderRestartButton(c, x);
    }

    if (state && _player.isAlive) score++; // real score is score/5.floor()
    // _player.renderHitBox(c);
    // _player.renderState(c);
  }

  void gameOver() {
    state = false;
    _acceptsTabs = true;
  }

  void _renderScore(Canvas c, x) {
    String text = (score / 5).floor().toString();

    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'DpComic',
              fontSize: 50,
              color: !read(darkWorldProvider)
                  ? Color.fromRGBO(17, 17, 17, 1)
                  : Color.fromRGBO(186, 186, 186, 1))),
      textDirection: TextDirection.ltr,
    )..layout();

    c.save();
    tp.paint(c, Offset(x.width/2 - tp.width/2, x.height/4.4 - tp.height/2));
    c.restore();
  }

  final _buttonSize = Size(150, 50);

  void _renderStartGameButton(Canvas c, x) {
    final r = Offset(x.width / 2 - _buttonSize.width / 2,
            x.height / 3 - _buttonSize.height / 2) &
        _buttonSize;
    _renderButton("Init();", c, x);
    if (r.contains(_tab)) {
      _startGame();
      _tab = Offset.zero;
    }
  }

  void _renderRestartButton(Canvas c, x) {
    final r = Offset(x.width / 2 - _buttonSize.width / 2,
            x.height / 3- _buttonSize.height / 2) &
        _buttonSize;
    _renderButton("Restart();", c, x);
    if (r.contains(_tab)) {
      _tab = Offset.zero;
      _restartGame();
    }
  }

  void _renderButton(String text, Canvas c, x) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'DpComic',
              fontSize: 40,
              color: !read(darkWorldProvider)
                  ? Color.fromRGBO(17, 17, 17, 1)
                  : Color.fromRGBO(186, 186, 186, 1))),
      textDirection: TextDirection.ltr,
    )..layout();
    final r = Offset(x.width /2 - tp.width / 2, x.height / 3 - tp.height / 2) &
        tp.size;
    c.save();
    tp.paint(c, r.topLeft);
    c.restore();
  }

  bool get acceptsTabs => _acceptsTabs;
  bool _acceptsTabs = true;

  Offset _tab = Offset.zero;

  void setTab(Offset tab) {
    _tab = tab;
  }

  void _startGame() {
    _acceptsTabs = false;
    state = true;
    _player.startGame();
    _spawner.startGame();
  }

  void _restartGame() {
    score = 0;
    _player.restartGame();
    _spawner.restartGame();
  }
}

final gameProvider = StateNotifierProvider<GameController, bool>(
    (ref) => GameController(ref.read));
