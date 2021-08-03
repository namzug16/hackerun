// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'Player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PlayerTearOff {
  const _$PlayerTearOff();

  _Player call(
      {Offset position = const Offset(300, 300),
      Size size = const Size(100, 100),
      double velocityY = 0.0,
      double velocityX = 0.0}) {
    return _Player(
      position: position,
      size: size,
      velocityY: velocityY,
      velocityX: velocityX,
    );
  }
}

/// @nodoc
const $Player = _$PlayerTearOff();

/// @nodoc
mixin _$Player {
  Offset get position => throw _privateConstructorUsedError;
  Size get size => throw _privateConstructorUsedError;
  double get velocityY => throw _privateConstructorUsedError;
  double get velocityX => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call({Offset position, Size size, double velocityY, double velocityX});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? position = freezed,
    Object? size = freezed,
    Object? velocityY = freezed,
    Object? velocityX = freezed,
  }) {
    return _then(_value.copyWith(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      velocityY: velocityY == freezed
          ? _value.velocityY
          : velocityY // ignore: cast_nullable_to_non_nullable
              as double,
      velocityX: velocityX == freezed
          ? _value.velocityX
          : velocityX // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call({Offset position, Size size, double velocityY, double velocityX});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object? position = freezed,
    Object? size = freezed,
    Object? velocityY = freezed,
    Object? velocityX = freezed,
  }) {
    return _then(_Player(
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      velocityY: velocityY == freezed
          ? _value.velocityY
          : velocityY // ignore: cast_nullable_to_non_nullable
              as double,
      velocityX: velocityX == freezed
          ? _value.velocityX
          : velocityX // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Player with DiagnosticableTreeMixin implements _Player {
  _$_Player(
      {this.position = const Offset(300, 300),
      this.size = const Size(100, 100),
      this.velocityY = 0.0,
      this.velocityX = 0.0});

  @JsonKey(defaultValue: const Offset(300, 300))
  @override
  final Offset position;
  @JsonKey(defaultValue: const Size(100, 100))
  @override
  final Size size;
  @JsonKey(defaultValue: 0.0)
  @override
  final double velocityY;
  @JsonKey(defaultValue: 0.0)
  @override
  final double velocityX;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Player(position: $position, size: $size, velocityY: $velocityY, velocityX: $velocityX)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Player'))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('velocityY', velocityY))
      ..add(DiagnosticsProperty('velocityX', velocityX));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Player &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.size, size) ||
                const DeepCollectionEquality().equals(other.size, size)) &&
            (identical(other.velocityY, velocityY) ||
                const DeepCollectionEquality()
                    .equals(other.velocityY, velocityY)) &&
            (identical(other.velocityX, velocityX) ||
                const DeepCollectionEquality()
                    .equals(other.velocityX, velocityX)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(size) ^
      const DeepCollectionEquality().hash(velocityY) ^
      const DeepCollectionEquality().hash(velocityX);

  @JsonKey(ignore: true)
  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);
}

abstract class _Player implements Player {
  factory _Player(
      {Offset position,
      Size size,
      double velocityY,
      double velocityX}) = _$_Player;

  @override
  Offset get position => throw _privateConstructorUsedError;
  @override
  Size get size => throw _privateConstructorUsedError;
  @override
  double get velocityY => throw _privateConstructorUsedError;
  @override
  double get velocityX => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlayerCopyWith<_Player> get copyWith => throw _privateConstructorUsedError;
}
