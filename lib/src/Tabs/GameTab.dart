import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:funvas/funvas.dart';
import 'package:hackerun/src/Player/PlayerController.dart';
import 'package:hackerun/src/Widgets/Ground.dart';
import 'package:hackerun/src/Widgets/TestButton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../GameController.dart';

class GameTab extends HookWidget {
  const GameTab(this.parentContext, {Key? key}) : super(key: key);

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {

    final game = useProvider(gameProvider.notifier);
    final playerController = useProvider(playerProvider.notifier);

    useEffect((){
      game.init(MediaQuery.of(parentContext).size);
    },[]);

    return Scaffold(
      body: GestureDetector(
        onTapDown: (details){
          playerController.jump();
        },
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FunvasContainer(
                funvas: GameFunvas(game),
              ),
            ),
            RepaintBoundary(child: Ground()),
            RepaintBoundary(child: TestButton()),
          ],
        ),
      ),
    );
  }
}

class GameFunvas extends Funvas {

  GameFunvas(this.game);

  final GameController game;

  @override
  void u(double t) {
    game.renderGame(c, x);
  }

}