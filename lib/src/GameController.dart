import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackerun/src/Enemies/EnemySpawnerController.dart';
import 'package:hackerun/src/Player/PlayerController.dart';
import 'package:hackerun/src/WordlProviders/WorldElements.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameController extends StateNotifier<bool> {
  GameController(this.read) : super(false);

  final Reader read;

  late final PlayerController _player;
  late final EnemySpawnerController _spawner;
  late final WorldElements _elements;
  late final WorldVariables _wv;

  void init(Size size) {
    _player = read(playerProvider.notifier);
    _spawner = read(enemySpawnerProvider.notifier);
    _elements = read(worldElementsProvider.notifier);
    _wv = read(worldVariablesProvider.notifier);
    _player.init(size);
    _spawner.init();
  }

  int _score = 0;

  /// Colors;
  ///rgb(17, 17, 17); dark
  ///186 186 light
  ///33 210 246 blue
  void renderGame(Canvas c, x) {
    _updateWorldVelocity();
    c.drawPaint(Paint()
      ..color = _wv.isDark
          ? Color.fromRGBO(17, 17, 17, 1)
          : Color.fromRGBO(186, 186, 186, 1));
    _spawner.renderEnemies(c, x);
    _player.renderPlayer(c, x);
    _elements.renderWorldElements(c, x);
    _renderScore(c, x);
    if (!state && _score == 0) {
      _renderStartGameButton(c, x);
    } else if (!state && _score > 0) {
      _renderRestartButton(c, x);
    }

    if (state && _player.isAlive) _score++; // real score is score/5.floor()
    // _player.renderHitBox(c);
    // _player.renderState(c);
  }

  void gameOver() {
    state = false;
    _acceptsTaps = true;
  }

  void _renderScore(Canvas c, x) {
    String text = (_score / 5).floor().toString();

    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'DpComic',
              fontSize: 50,
              color: !_wv.isDark
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

  bool inc = true;
  final double iniFS = 0;
  final double endFS = 15;
  double? p;
  void _renderButton(String text, Canvas c, x) {
    if(p == null) p = iniFS;
    if(inc){
      p = p! + 0.5;
      if(p == endFS) inc = false;
    }else{
      p = p! - 0.5;
      if(p == iniFS) inc = true;
    }
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontFamily: 'DpComic',
              fontSize: 40,
              color: !_wv.isDark
                  ? Color.fromRGBO(17, 17, 17, 1)
                  : Color.fromRGBO(186, 186, 186, 1))),
      textDirection: TextDirection.ltr,
    )..layout();
    final r = Offset(x.width /2 - tp.width / 2, x.height / 3 - tp.height / 2 + p) &
        tp.size;
    c.save();
    tp.paint(c, r.topLeft);
    c.restore();
  }

  bool get acceptsTaps => _acceptsTaps;
  bool _acceptsTaps = true;

  Offset _tab = Offset.zero;

  void setTap(Offset tab) {
    _tab = tab;
  }

  bool get gameStarted => _gameStarted;
  bool _gameStarted = false;

  void _startGame() {
    _acceptsTaps = false;
    _gameStarted = true;
    state = true;
    _player.startGame();
    _spawner.startGame();
  }

  void _restartGame() {
    _score = 0;
    _gameStarted = false;
    _player.restartGame();
    _spawner.restartGame();
    _savedValueSpeed = 0;
    _savedValueDark = 0;
    _wv.restart();
  }

  int _savedValueSpeed = 0;
  int _savedValueDark = 0;
  void _updateWorldVelocity(){
    if((_score/120).floor() != _savedValueSpeed && _wv.speed < 2.5){
      _wv.incrementSpeed();
      _savedValueSpeed++;
    }
    if(((_score/5)/500).floor() != _savedValueDark){
      _wv.changeColorWorld();
      _savedValueDark++;
    }
  }
}

final gameProvider = StateNotifierProvider<GameController, bool>(
    (ref) => GameController(ref.read));
