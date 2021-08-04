import 'package:flutter/material.dart';
import 'package:hackerun/src/Tabs/TestTab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/Tabs/GameTab.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackerun',
      theme: ThemeData(
        fontFamily: 'DpComic'
      ),
      // home: GameTab(),
      home: TestTab(),
    );
  }
}