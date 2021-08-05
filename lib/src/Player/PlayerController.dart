import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:hackerun/src/Enemies/EnemySpawnerController.dart';
import 'package:hackerun/src/GameController.dart';
import 'package:hackerun/src/GlobalVariables.dart';
import 'package:hackerun/src/Helpers/loadImage.dart';
import 'package:hackerun/src/Player/Player.dart';
import 'package:hackerun/src/Player/States.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Extensions/OffsetExtensions.dart';

class PlayerController extends StateNotifier<Player> {
  PlayerController(this.read) : super(Player());

  final Reader read;

  EnemySpawnerController? _spawner;
  late final WorldVariables _wv;

  // * Player variables
  static const double jumpVelocity = 20;

  // acceleration is then set based on the distance to jump
  // and the max velocity of the jump
  double acceleration = 1;
  static const double maxDistanceToJump = 2 * 16 * scaleFactor * 1.3;

  Image? sprite;

  MovementStates _mS = MovementStates.Idle;
  LifeStates _lS = LifeStates.Alive;

  bool get isAlive => _lS == LifeStates.Alive;

  // ! ===============================================================> Methods

  Offset _initialPosition = Offset.zero;

  void init(Size size) async {
    sprite = await loadImage("Hacker-Sheet.png");
    _wv = read(worldVariablesProvider.notifier);
    _spawner = read(enemySpawnerProvider.notifier);
    // size of the entire sprite
    state = state.copyWith(size: Size(16 * scaleFactor, 16 * scaleFactor));
    state = state.copyWith(
        position: Offset(size.width / 2, size.height - maxSizeFloor) -
            Offset(state.size.width / 2, state.size.height));
    _initialPosition = state.position;
    // size of hitBox
    state = state.copyWith(
        size: Size(state.size.width - 9 * scaleFactor,
            state.size.height - 2 * scaleFactor));
  }

  bool _gameStarted = false;

  void startGame() {
    _gameStarted = true;
  }

  void restartGame() {
    _gameStarted = false;
    _setState(MovementStates.Idle);
    _lS = LifeStates.Alive;
  }

  void renderPlayer(Canvas c, x) {
    if(sprite != null){
      _stateLogic(x);
      _checkCollision();
      c.save();
      c.translate(state.position.dx, state.position.dy);
      c.scale(scaleFactor);
      if (sprite != null) {
        _spriteAnimation(c);
      }
      c.restore();
    }
  }

  // * ===================== State
  //Run 0
  //Metal 1 extra animation that I liked
  //Idle 2
  //Hurt 3
  //Jump 4
  //Fall 5
  //DoubleJump 6

  void _stateLogic(x) {
    if (_lS == LifeStates.Alive) {
      _move(x);
      switch (_mS) {
        case MovementStates.Idle:
          animationIndex = 2;
          break;
        case MovementStates.Run:
          animationIndex = 0;
          break;
        case MovementStates.Jump:
          animationIndex = 4;
          break;
        case MovementStates.DoubleJump:
          animationIndex = 6;
          break;
        case MovementStates.Fall:
          animationIndex = 5;
          break;
      }
    } else {
      animationIndex = 3;
    }
  }

  MovementStates _oldState = MovementStates.Idle;

  void _setState(MovementStates newState) {
    frame = 0;
    frameCount = 0;
    switch (_mS) {
      case MovementStates.Idle:
        _oldState = _mS;
        _mS = newState;
        break;
      case MovementStates.Run:
        if (newState == MovementStates.Jump ||
            newState == MovementStates.Idle) {
          _oldState = _mS;
          _mS = newState;
        }
        break;
      case MovementStates.Jump:
        if (newState == MovementStates.DoubleJump ||
            newState == MovementStates.Fall ||
            newState == MovementStates.Idle) {
          _oldState = _mS;
          _mS = newState;
        }
        break;
      case MovementStates.DoubleJump:
        if (newState == MovementStates.Fall ||
            newState == MovementStates.Idle) {
          _oldState = _mS;
          _mS = newState;
        }
        break;
      case MovementStates.Fall:
        if (newState == MovementStates.Run) {
          _oldState = _mS;
          state = state.copyWith(velocityY: 0);
          _mS = newState;
        } else if (newState == MovementStates.DoubleJump ||
            newState == MovementStates.Idle) {
          _oldState = _mS;
          _mS = newState;
        }
        break;
    }
  }

  // ? ======================================= Actions
  void jump() {
    if (_mS == MovementStates.Run) {
      _setState(MovementStates.Jump);
      state =
          state.copyWith(velocityY: jumpVelocity * _wv.speed);
    } else if (_mS == MovementStates.Jump) {
      state =
          state.copyWith(velocityY: jumpVelocity * _wv.speed);
      _setState(MovementStates.DoubleJump);
    } else if (_mS == MovementStates.Fall && _oldState == MovementStates.Jump) {
      state =
          state.copyWith(velocityY: jumpVelocity * _wv.speed);
      _setState(MovementStates.DoubleJump);
    }
  }

  void _move(x) {
    acceleration = (pow(jumpVelocity * _wv.speed, 2) /
            (2 * maxDistanceToJump));
    if (state.position == _initialPosition &&
        _mS != MovementStates.Run &&
        _gameStarted) {
      _setState(MovementStates.Run);
    }
    if (_mS == MovementStates.Jump || _mS == MovementStates.DoubleJump) {
      state = state.copyWith(
          velocityY: state.velocityY - acceleration,
          position: state.position - Offset(0, state.velocityY));
      if (state.velocityY <= 0) {
        _setState(MovementStates.Fall);
      }
    } else if (_mS == MovementStates.Fall) {
      state = state.copyWith(
          velocityY: state.velocityY + acceleration,
          position: (state.position + Offset(0, state.velocityY))
              .clamp(Offset.zero, _initialPosition));
    } else if (_mS == MovementStates.Idle &&
        state.position != _initialPosition) {
      state = state.copyWith(
          velocityY: state.velocityY + acceleration,
          position: (state.position + Offset(0, state.velocityY))
              .clamp(Offset.zero, _initialPosition));
    }
  }

  // * ========== Animations
  int animationIndex = 2;
  int frame = 0;
  int frameCount = 0;

  void _spriteAnimation(Canvas c) {
    final dark = _wv.isDark;
    final List<int> v = framesValuesPlayer[animationIndex]; // frame Values
    final int amountFrames = spritesPlayer[animationIndex].length;
    final int fc = 60 ~/ v[0];
    frameCount++;
    if (frameCount == fc) {
      if (frame < amountFrames) frame++;
      if (v[1] == 1 && frame == amountFrames) {
        frame = 0;
      } else if (v[1] == 0 && frame == amountFrames) {
        frame = amountFrames - 1;
      }
      frameCount = 0;
    }
    c.drawImageRect(
        sprite!,
        Rect.fromLTWH(spritesPlayer[animationIndex][frame].dx,
            spritesPlayer[animationIndex][frame].dy + (dark ? 16 : 0), 16, 16),
        Rect.fromLTWH(0, 0, 16, 16),
        Paint());
  }

  // * ========= Collision

  void _checkCollision() {
    final posHB = state.position + Offset(5 * scaleFactor, 2 * scaleFactor);
    if (_spawner != null) {
      if (_spawner!.firewalls.length > 0) {
        for (var f in _spawner!.firewalls) {
          if ((posHB & state.size).overlaps(f.hitBox)) {
            _kill();
          }
        }
      }
      if (_spawner!.bugs.length > 0) {
        for (var b in _spawner!.bugs) {
          if ((posHB & state.size).overlaps(b.hitBox)) {
            _kill();
          }
        }
      }
    }
  }

  void _kill() {
    if (_lS == LifeStates.Alive) {
      frame = 0;
      frameCount = 0;
      _lS = LifeStates.Dead;
    }
    read(gameProvider.notifier).gameOver();
  }

  // * ========== Debug

  void renderHitBox(Canvas c) {
    final Rect hitBox =
        (state.position + Offset(5 * scaleFactor, 2 * scaleFactor)) &
            state.size;
    c.save();
    c.drawRect(hitBox, Paint()..color = Colors.blueAccent.withOpacity(0.3));
    c.restore();
  }

  void renderState(Canvas c) {
    final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: _mS.toString(),
            style: TextStyle(fontSize: 20, color: Colors.redAccent)))
      ..layout();

    final textPainter2 = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: "old: " + _oldState.toString(),
            style: TextStyle(fontSize: 20, color: Colors.redAccent)))
      ..layout();

    textPainter.paint(c, state.position - Offset(0, textPainter.height));
    textPainter2.paint(
        c,
        state.position -
            Offset(0, textPainter.height) -
            Offset(0, textPainter2.height));
  }
}

final playerProvider = StateNotifierProvider<PlayerController, Player>(
    (ref) => PlayerController(ref.read));

// framesValues => [framesPerSecond, isLoop?]
const framesValuesPlayer = [
  [15, 1], //Run 0
  [12, 1], //Metal 1
  [12, 1], //Idle 2
  [10, 0], //Hurt 3
  [25, 0], //Jump 4
  [18, 1], //Fall 5
  [25, 1], //DoubleJump 6
];

const spritesPlayer = [
  [
    Offset(0, 0),
    Offset(16, 0),
    Offset(32, 0),
    Offset(48, 0),
    Offset(64, 0),
    Offset(80, 0),
    Offset(96, 0),
    Offset(112, 0)
  ], // Run
  [
    Offset(0, 32),
    Offset(16, 32),
    Offset(32, 32),
    Offset(48, 32),
    Offset(64, 32),
  ], // Metal
  [
    Offset(0, 64),
    Offset(16, 64),
    Offset(32, 64),
    Offset(48, 64),
    Offset(64, 64),
    Offset(80, 64),
    Offset(96, 64),
    Offset(112, 64)
  ], // Idle
  [
    Offset(0, 96),
    Offset(16, 96),
    Offset(32, 96),
    Offset(48, 96),
    Offset(64, 96),
  ], // Hurt
  [
    Offset(0, 128),
    Offset(16, 128),
    Offset(32, 128),
    Offset(48, 128),
  ], // Jump
  [
    Offset(0, 160),
    Offset(16, 160),
  ], // Fall
  [
    Offset(0, 192),
    Offset(16, 192),
    Offset(32, 192),
    Offset(48, 192),
    Offset(64, 192),
    Offset(80, 192),
    Offset(96, 192),
  ], // DoubleJump
];
