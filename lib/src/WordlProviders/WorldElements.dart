import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackerun/src/GameController.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../GlobalVariables.dart';

class WorldElements extends StateNotifier<bool>{
  WorldElements(this.read): super(true);

  final Reader read;

  void renderWorldElements(Canvas c, x){
    final isDark = read(worldVariablesProvider.notifier).isDark;

    _drawTitle(c, x, isDark);
    _drawGround(c, x, isDark);
    if(!read(gameProvider.notifier).gameStarted) _drawInstructions(c, x);
  }

  void _drawInstructions(Canvas c, x){
    final tp = TextPainter(
      text: TextSpan(
        text: "Controls are REALLY HARD!! just click once to jump and click again to double jump. \n\nTry to evade all those firewalls and bugs!!!",
        style: TextStyle(
          color: Color.fromRGBO(17, 17, 17, 1),
          fontFamily: 'DpComic',
          fontSize: 30
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 300);

    tp.paint(c, Offset(50, 100));

  }

  void _drawTitle(Canvas c, x, bool isDark){
    final tpTitle = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: "Hackerun",
          style: TextStyle(
              fontFamily: 'DpComic',
              fontSize: 100,
              color: !isDark ? Color.fromRGBO(17, 17, 17, 1)
                  : Color.fromRGBO(186, 186, 186, 1)
          ),
        )
    )..layout();

    tpTitle.paint(c, Offset(x.width/2 - tpTitle.width/2, 50));
  }

  void _drawGround(Canvas c, x, bool isDark){
    c.drawRect(
        Offset(-100, x.height - maxSizeFloor) & Size(x.width*1.2, maxSizeFloor*1.2),
        Paint()
          ..color = !isDark
              ? Color.fromRGBO(17, 17, 17, 1)
              : Color.fromRGBO(186, 186, 186, 1));
  }
}

final worldElementsProvider = StateNotifierProvider<WorldElements, bool>((ref) => WorldElements(ref.read));