import 'package:flutter/material.dart';
import 'package:hackerun/src/Tabs/GameTab.dart';

class TestTab extends StatelessWidget {
  const TestTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GameTab(context),
    );
  }
}
