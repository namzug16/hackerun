import 'dart:ui';

import 'package:hackerun/src/Enemies/Firewall.dart';
import 'package:hackerun/src/Helpers/loadImage.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EnemySpawnerController extends StateNotifier<bool> {
  EnemySpawnerController(this.read) : super(false);

  final Reader read;
  Image? spriteSheet;

  void init() async {
    spriteSheet = await loadImage("HackerEnemies-Sheet.png");
  }

  List<Firewall>? firewalls;

  void renderEnemies(Canvas c, x) {
    final dark = read(darkWorldProvider);
    if (spriteSheet != null) {
      // if (firewalls != null)
      if (firewalls == null)
        firewalls = [
          Firewall(
              size: Size(x.width, x.height),
              lvl: 2,
              vel: 10,
              sprite: spriteSheet!,
              isDark: dark)
        ];
      for (var f in firewalls!) {
        // TODO: Change color when its not dark but world is
        f.renderFirewall(c);
      }
    }
  }
}

final enemySpawnerProvider =
    StateNotifierProvider<EnemySpawnerController, bool>(
        (ref) => EnemySpawnerController(ref.read));
