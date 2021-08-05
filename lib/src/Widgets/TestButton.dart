import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hackerun/src/WordlProviders/WorldProviders.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestButton extends HookWidget {
  const TestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final dark = useProvider(darkWorldProvider.notifier);
    // final wv = useProvider(worldSpeed);
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              // dark.change();
              // wv.state += 0.01;
              // print(wv.state);
            },
            child: const Text("Test"),
          ),
          TextButton(
            onPressed: () {
              // wv.state = 2;
              // print(wv.state);
            },
            child: const Text("Set World Speed"),
          ),
          Text("Hackerun", style: TextStyle(fontSize: 100),),
        ],
      ),
    );
  }
}
