import 'package:flutter/material.dart';

import '../GlobalVariables.dart';

class Ground extends StatelessWidget {
  const Ground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: GroundPainter(),
        ),
      ),
    );
  }
}

class GroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Offset(0, size.height - maxSizeFloor) & Size(size.width, maxSizeFloor),
        Paint()..color = Colors.black87);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
