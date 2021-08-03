import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../GlobalVariables.dart';

class Ground extends HookWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = useProvider(darkWorldProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: GroundPainter(isDark),
      ),
    );
  }
}

class GroundPainter extends CustomPainter {
  GroundPainter(this.isDark);

  final bool isDark;

  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawRect(
        Offset(0, size.height - maxSizeFloor) & Size(size.width, maxSizeFloor),
        Paint()
          ..color = !isDark
              ? Color.fromRGBO(17, 17, 17, 1)
              : Color.fromRGBO(186, 186, 186, 1));

    // * Grid
    // final as = 20;
    // final double sizeS = 16 * scaleFactor;
    // for (var i = 0; i < as; i++) {
    //   for(var j = 0; j < as; j++){
    //     canvas.drawRect(
    //         Rect.fromLTWH(j * 16 * scaleFactor, i * 16 * scaleFactor, sizeS, sizeS),
    //         Paint()
    //           ..color = Colors.blueAccent
    //           ..style = PaintingStyle.stroke
    //           ..strokeWidth = 3);
    //   }
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
