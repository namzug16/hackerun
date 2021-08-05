import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorldVariables extends StateNotifier<bool> {
  WorldVariables() : super(true);

  bool get isDark => _isDark;
  bool _isDark = false;

  double get speed => _speed;
  double _speed = 1;

  void changeColorWorld() {
    _isDark = !_isDark;
  }

  void incrementSpeed() {
    _speed += 0.02;
  }
}

final worldVariablesProvider =
    StateNotifierProvider<WorldVariables, bool>((ref) => WorldVariables());