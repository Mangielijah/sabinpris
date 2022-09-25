// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeneralStatistics {
  String get description => throw _privateConstructorUsedError;
  int get roll => throw _privateConstructorUsedError;
  int get feesDue => throw _privateConstructorUsedError;
  int get registration => throw _privateConstructorUsedError;
  int get feesPaid => throw _privateConstructorUsedError;
  int get totalIncome => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralStatisticsCopyWith<GeneralStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralStatisticsCopyWith<$Res> {
  factory $GeneralStatisticsCopyWith(
          GeneralStatistics value, $Res Function(GeneralStatistics) then) =
      _$GeneralStatisticsCopyWithImpl<$Res>;
  $Res call(
      {String description,
      int roll,
      int feesDue,
      int registration,
      int feesPaid,
      int totalIncome});
}

/// @nodoc
class _$GeneralStatisticsCopyWithImpl<$Res>
    implements $GeneralStatisticsCopyWith<$Res> {
  _$GeneralStatisticsCopyWithImpl(this._value, this._then);

  final GeneralStatistics _value;
  // ignore: unused_field
  final $Res Function(GeneralStatistics) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? roll = freezed,
    Object? feesDue = freezed,
    Object? registration = freezed,
    Object? feesPaid = freezed,
    Object? totalIncome = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      roll: roll == freezed
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
      feesDue: feesDue == freezed
          ? _value.feesDue
          : feesDue // ignore: cast_nullable_to_non_nullable
              as int,
      registration: registration == freezed
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: feesPaid == freezed
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GeneralStatisticsCopyWith<$Res>
    implements $GeneralStatisticsCopyWith<$Res> {
  factory _$$_GeneralStatisticsCopyWith(_$_GeneralStatistics value,
          $Res Function(_$_GeneralStatistics) then) =
      __$$_GeneralStatisticsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      int roll,
      int feesDue,
      int registration,
      int feesPaid,
      int totalIncome});
}

/// @nodoc
class __$$_GeneralStatisticsCopyWithImpl<$Res>
    extends _$GeneralStatisticsCopyWithImpl<$Res>
    implements _$$_GeneralStatisticsCopyWith<$Res> {
  __$$_GeneralStatisticsCopyWithImpl(
      _$_GeneralStatistics _value, $Res Function(_$_GeneralStatistics) _then)
      : super(_value, (v) => _then(v as _$_GeneralStatistics));

  @override
  _$_GeneralStatistics get _value => super._value as _$_GeneralStatistics;

  @override
  $Res call({
    Object? description = freezed,
    Object? roll = freezed,
    Object? feesDue = freezed,
    Object? registration = freezed,
    Object? feesPaid = freezed,
    Object? totalIncome = freezed,
  }) {
    return _then(_$_GeneralStatistics(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      roll: roll == freezed
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
      feesDue: feesDue == freezed
          ? _value.feesDue
          : feesDue // ignore: cast_nullable_to_non_nullable
              as int,
      registration: registration == freezed
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: feesPaid == freezed
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GeneralStatistics extends _GeneralStatistics {
  _$_GeneralStatistics(
      {required this.description,
      required this.roll,
      required this.feesDue,
      required this.registration,
      required this.feesPaid,
      required this.totalIncome})
      : super._();

  @override
  final String description;
  @override
  final int roll;
  @override
  final int feesDue;
  @override
  final int registration;
  @override
  final int feesPaid;
  @override
  final int totalIncome;

  @override
  String toString() {
    return 'GeneralStatistics(description: $description, roll: $roll, feesDue: $feesDue, registration: $registration, feesPaid: $feesPaid, totalIncome: $totalIncome)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralStatistics &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.roll, roll) &&
            const DeepCollectionEquality().equals(other.feesDue, feesDue) &&
            const DeepCollectionEquality()
                .equals(other.registration, registration) &&
            const DeepCollectionEquality().equals(other.feesPaid, feesPaid) &&
            const DeepCollectionEquality()
                .equals(other.totalIncome, totalIncome));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(roll),
      const DeepCollectionEquality().hash(feesDue),
      const DeepCollectionEquality().hash(registration),
      const DeepCollectionEquality().hash(feesPaid),
      const DeepCollectionEquality().hash(totalIncome));

  @JsonKey(ignore: true)
  @override
  _$$_GeneralStatisticsCopyWith<_$_GeneralStatistics> get copyWith =>
      __$$_GeneralStatisticsCopyWithImpl<_$_GeneralStatistics>(
          this, _$identity);
}

abstract class _GeneralStatistics extends GeneralStatistics {
  factory _GeneralStatistics(
      {required final String description,
      required final int roll,
      required final int feesDue,
      required final int registration,
      required final int feesPaid,
      required final int totalIncome}) = _$_GeneralStatistics;
  _GeneralStatistics._() : super._();

  @override
  String get description;
  @override
  int get roll;
  @override
  int get feesDue;
  @override
  int get registration;
  @override
  int get feesPaid;
  @override
  int get totalIncome;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralStatisticsCopyWith<_$_GeneralStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}
