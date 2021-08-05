import 'dart:math';
import 'dart:ui';

import 'package:hackerun/src/Enemies/Firewall.dart';
import 'package:hackerun/src/GlobalVariables.dart';
import 'package:hackerun/src/Helpers/loadImage.dart';
import 'package:hackerun/src/Player/PlayerController.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Bug.dart';

class EnemySpawnerController extends StateNotifier<bool> {
  EnemySpawnerController(this.read) : super(false);

  final Reader read;

  late final PlayerController _player;
  late final WorldVariables _wv;
  Image? spriteSheet;

  void init() async {
    spriteSheet = await loadImage("HackerEnemies-Sheet.png");
    _player = read(playerProvider.notifier);
    _wv = read(worldVariablesProvider.notifier);
  }

  bool _gameStarted = false;

  void startGame() {
    _gameStarted = true;
  }

  void restartGame(){
    _gameStarted = false;
    firewalls.clear();
    bugs.clear();
  }

  List<Firewall> firewalls = [];
  List<Bug> bugs = [];

  int? firewallToDelete;
  int? bugToDelete;

  bool? _savedDark;

  void renderEnemies(Canvas c, x) {
    if (spriteSheet != null) {
    final dark = _wv.isDark;
    if (_savedDark == null) _savedDark = dark;
      if (_gameStarted) {
        _getObstacle(x, dark);
      }
      if (firewalls.length > 0) {
        for (var f in firewalls) {
          if (dark != _savedDark) {
            f.setDark();
          }
          if (!_player.isAlive) f.stop();
          f.renderFirewall(c);
          if (f.shouldBeDeleted && firewallToDelete == null)
            firewallToDelete = firewalls.indexOf(f);
        }
        if (firewallToDelete != null) {
          firewalls.removeAt(firewallToDelete!);
          firewallToDelete = null;
        }
      }
      if (bugs.length > 0) {
        for (var b in bugs) {
          if (dark != _savedDark) {
            b.setDark();
          }
          if (!_player.isAlive) b.stop();
          b.renderBug(c);
          if (b.shouldBeDeleted && bugToDelete == null)
            bugToDelete = bugs.indexOf(b);
        }
        if (bugToDelete != null) {
          bugs.removeAt(bugToDelete!);
          bugToDelete = null;
        }
      }
      if (dark != _savedDark) _savedDark = dark;
    }
  }

  int _bigDistanceBetweenObstacles = (1.5 * 16 * scaleFactor).toInt();
  int _smallDistanceBetweenObstacles = (0.8 * 16 * scaleFactor).toInt();
  int _countFramesForNewObstacle = 0;

  void _getObstacle(x, bool isDark) {
    if (_countFramesForNewObstacle > 0) _countFramesForNewObstacle--;

    if (_countFramesForNewObstacle == 0) {
      int indexObstacle = Random().nextInt(10);
      switch (indexObstacle) {
        case 0:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 1);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 2, 1);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 3, 1);
          _countFramesForNewObstacle = _bigDistanceBetweenObstacles;
          break;
        case 1:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 1);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 2, 1);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 3, 1);
          _addBug(x, isDark, x.width + 16 * scaleFactor, true);
          _addBug(x, isDark, x.width, true);
          _countFramesForNewObstacle = _bigDistanceBetweenObstacles;
          break;
        case 2:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 1);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 3:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 1);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 2, 1);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 4:
          _addBug(x, isDark, x.width + 16 * scaleFactor, false);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 5:
          _addBug(x, isDark, x.width + 16 * scaleFactor, false);
          _addBug(x, isDark, x.width + 16 * scaleFactor * 2, false);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 6:
          _addBug(x, isDark, x.width + 16 * scaleFactor, false);
          _addBug(x, isDark, x.width + 16 * scaleFactor, true);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 7:
          _addBug(x, isDark, x.width + 16 * scaleFactor, false);
          _addBug(x, isDark, x.width, true);
          _addBug(x, isDark, x.width + 16 * scaleFactor, true);
          _addBug(x, isDark, x.width + 16 * scaleFactor * 2, true);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
        case 8:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 2);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 2, 2);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 3, 2);
          _countFramesForNewObstacle = _bigDistanceBetweenObstacles;
          break;
        case 9:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 2);
          _addFirewall(x, isDark, x.width + 16 * scaleFactor * 2, 2);
          _countFramesForNewObstacle = _bigDistanceBetweenObstacles;
          break;
        case 10:
          _addFirewall(x, isDark, x.width + 16 * scaleFactor, 2);
          _countFramesForNewObstacle = _smallDistanceBetweenObstacles;
          break;
      }
    }
  }

  void _addFirewall(x, bool isDark, double posX, int lvl) {
    firewalls.add(Firewall(
      size: Size(x.width, x.height),
      lvl: lvl,
      posX: posX,
      // vel: 10*read(worldSpeed).state,
      vel: 10*_wv.speed,
      sprite: spriteSheet!,
      isDark: isDark,
    ));
  }

  void _addBug(x, bool isDark, double posX, bool fly) {
    bugs.add(Bug(
        fly: fly,
        sprite: spriteSheet!,
        posX: posX,
        // vel: 10*read(worldSpeed).state,
        vel: 10*_wv.speed,
        isDark: isDark,
        size: Size(x.width, x.height)));
  }
}

final enemySpawnerProvider =
    StateNotifierProvider<EnemySpawnerController, bool>(
        (ref) => EnemySpawnerController(ref.read));
