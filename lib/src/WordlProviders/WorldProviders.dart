import 'package:hooks_riverpod/hooks_riverpod.dart';

class DarkWorld extends StateNotifier<bool> {
  DarkWorld() : super(false);

  void change() {
    state = !state;
  }
}

final darkWorldProvider =
    StateNotifierProvider<DarkWorld, bool>((ref) => DarkWorld());

final worldSpeed = StateProvider<double>((ref) => 1);