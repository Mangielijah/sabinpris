// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeneralStatisticsDto {
  String get description => throw _privateConstructorUsedError;
  int get roll => throw _privateConstructorUsedError;
  int get feesDue => throw _privateConstructorUsedError;
  int get registration => throw _privateConstructorUsedError;
  int get feesPaid => throw _privateConstructorUsedError;
  int get totalIncome => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralStatisticsDtoCopyWith<GeneralStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralStatisticsDtoCopyWith<$Res> {
  factory $GeneralStatisticsDtoCopyWith(GeneralStatisticsDto value,
          $Res Function(GeneralStatisticsDto) then) =
      _$GeneralStatisticsDtoCopyWithImpl<$Res>;
  $Res call(
      {String description,
      int roll,
      int feesDue,
      int registration,
      int feesPaid,
      int totalIncome,
      int balance});
}

/// @nodoc
class _$GeneralStatisticsDtoCopyWithImpl<$Res>
    implements $GeneralStatisticsDtoCopyWith<$Res> {
  _$GeneralStatisticsDtoCopyWithImpl(this._value, this._then);

  final GeneralStatisticsDto _value;
  // ignore: unused_field
  final $Res Function(GeneralStatisticsDto) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? roll = freezed,
    Object? feesDue = freezed,
    Object? registration = freezed,
    Object? feesPaid = freezed,
    Object? totalIncome = freezed,
    Object? balance = freezed,
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
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GeneralStatisticsDtoCopyWith<$Res>
    implements $GeneralStatisticsDtoCopyWith<$Res> {
  factory _$$_GeneralStatisticsDtoCopyWith(_$_GeneralStatisticsDto value,
          $Res Function(_$_GeneralStatisticsDto) then) =
      __$$_GeneralStatisticsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      int roll,
      int feesDue,
      int registration,
      int feesPaid,
      int totalIncome,
      int balance});
}

/// @nodoc
class __$$_GeneralStatisticsDtoCopyWithImpl<$Res>
    extends _$GeneralStatisticsDtoCopyWithImpl<$Res>
    implements _$$_GeneralStatisticsDtoCopyWith<$Res> {
  __$$_GeneralStatisticsDtoCopyWithImpl(_$_GeneralStatisticsDto _value,
      $Res Function(_$_GeneralStatisticsDto) _then)
      : super(_value, (v) => _then(v as _$_GeneralStatisticsDto));

  @override
  _$_GeneralStatisticsDto get _value => super._value as _$_GeneralStatisticsDto;

  @override
  $Res call({
    Object? description = freezed,
    Object? roll = freezed,
    Object? feesDue = freezed,
    Object? registration = freezed,
    Object? feesPaid = freezed,
    Object? totalIncome = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_GeneralStatisticsDto(
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
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GeneralStatisticsDto extends _GeneralStatisticsDto {
  _$_GeneralStatisticsDto(
      {required this.description,
      required this.roll,
      required this.feesDue,
      required this.registration,
      required this.feesPaid,
      required this.totalIncome,
      required this.balance})
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
  final int balance;

  @override
  String toString() {
    return 'GeneralStatisticsDto(description: $description, roll: $roll, feesDue: $feesDue, registration: $registration, feesPaid: $feesPaid, totalIncome: $totalIncome, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralStatisticsDto &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.roll, roll) &&
            const DeepCollectionEquality().equals(other.feesDue, feesDue) &&
            const DeepCollectionEquality()
                .equals(other.registration, registration) &&
            const DeepCollectionEquality().equals(other.feesPaid, feesPaid) &&
            const DeepCollectionEquality()
                .equals(other.totalIncome, totalIncome) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(roll),
      const DeepCollectionEquality().hash(feesDue),
      const DeepCollectionEquality().hash(registration),
      const DeepCollectionEquality().hash(feesPaid),
      const DeepCollectionEquality().hash(totalIncome),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_GeneralStatisticsDtoCopyWith<_$_GeneralStatisticsDto> get copyWith =>
      __$$_GeneralStatisticsDtoCopyWithImpl<_$_GeneralStatisticsDto>(
          this, _$identity);
}

abstract class _GeneralStatisticsDto extends GeneralStatisticsDto {
  factory _GeneralStatisticsDto(
      {required final String description,
      required final int roll,
      required final int feesDue,
      required final int registration,
      required final int feesPaid,
      required final int totalIncome,
      required final int balance}) = _$_GeneralStatisticsDto;
  _GeneralStatisticsDto._() : super._();

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
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralStatisticsDtoCopyWith<_$_GeneralStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeeCollectionStatisticsDto {
  String get name => throw _privateConstructorUsedError;
  int get reg => throw _privateConstructorUsedError;
  int get feeAmt => throw _privateConstructorUsedError;
  List<int> get feesPaid => throw _privateConstructorUsedError;
  int get totalPaid => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeeCollectionStatisticsDtoCopyWith<FeeCollectionStatisticsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCollectionStatisticsDtoCopyWith<$Res> {
  factory $FeeCollectionStatisticsDtoCopyWith(FeeCollectionStatisticsDto value,
          $Res Function(FeeCollectionStatisticsDto) then) =
      _$FeeCollectionStatisticsDtoCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int reg,
      int feeAmt,
      List<int> feesPaid,
      int totalPaid,
      int balance});
}

/// @nodoc
class _$FeeCollectionStatisticsDtoCopyWithImpl<$Res>
    implements $FeeCollectionStatisticsDtoCopyWith<$Res> {
  _$FeeCollectionStatisticsDtoCopyWithImpl(this._value, this._then);

  final FeeCollectionStatisticsDto _value;
  // ignore: unused_field
  final $Res Function(FeeCollectionStatisticsDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? reg = freezed,
    Object? feeAmt = freezed,
    Object? feesPaid = freezed,
    Object? totalPaid = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg: reg == freezed
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmt: feeAmt == freezed
          ? _value.feeAmt
          : feeAmt // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: feesPaid == freezed
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaid: totalPaid == freezed
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FeeCollectionStatisticsDtoCopyWith<$Res>
    implements $FeeCollectionStatisticsDtoCopyWith<$Res> {
  factory _$$_FeeCollectionStatisticsDtoCopyWith(
          _$_FeeCollectionStatisticsDto value,
          $Res Function(_$_FeeCollectionStatisticsDto) then) =
      __$$_FeeCollectionStatisticsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int reg,
      int feeAmt,
      List<int> feesPaid,
      int totalPaid,
      int balance});
}

/// @nodoc
class __$$_FeeCollectionStatisticsDtoCopyWithImpl<$Res>
    extends _$FeeCollectionStatisticsDtoCopyWithImpl<$Res>
    implements _$$_FeeCollectionStatisticsDtoCopyWith<$Res> {
  __$$_FeeCollectionStatisticsDtoCopyWithImpl(
      _$_FeeCollectionStatisticsDto _value,
      $Res Function(_$_FeeCollectionStatisticsDto) _then)
      : super(_value, (v) => _then(v as _$_FeeCollectionStatisticsDto));

  @override
  _$_FeeCollectionStatisticsDto get _value =>
      super._value as _$_FeeCollectionStatisticsDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? reg = freezed,
    Object? feeAmt = freezed,
    Object? feesPaid = freezed,
    Object? totalPaid = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$_FeeCollectionStatisticsDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg: reg == freezed
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmt: feeAmt == freezed
          ? _value.feeAmt
          : feeAmt // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: feesPaid == freezed
          ? _value._feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaid: totalPaid == freezed
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FeeCollectionStatisticsDto extends _FeeCollectionStatisticsDto {
  _$_FeeCollectionStatisticsDto(
      {required this.name,
      required this.reg,
      required this.feeAmt,
      required final List<int> feesPaid,
      required this.totalPaid,
      required this.balance})
      : _feesPaid = feesPaid,
        super._();

  @override
  final String name;
  @override
  final int reg;
  @override
  final int feeAmt;
  final List<int> _feesPaid;
  @override
  List<int> get feesPaid {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feesPaid);
  }

  @override
  final int totalPaid;
  @override
  final int balance;

  @override
  String toString() {
    return 'FeeCollectionStatisticsDto(name: $name, reg: $reg, feeAmt: $feeAmt, feesPaid: $feesPaid, totalPaid: $totalPaid, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeCollectionStatisticsDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.reg, reg) &&
            const DeepCollectionEquality().equals(other.feeAmt, feeAmt) &&
            const DeepCollectionEquality().equals(other._feesPaid, _feesPaid) &&
            const DeepCollectionEquality().equals(other.totalPaid, totalPaid) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(reg),
      const DeepCollectionEquality().hash(feeAmt),
      const DeepCollectionEquality().hash(_feesPaid),
      const DeepCollectionEquality().hash(totalPaid),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_FeeCollectionStatisticsDtoCopyWith<_$_FeeCollectionStatisticsDto>
      get copyWith => __$$_FeeCollectionStatisticsDtoCopyWithImpl<
          _$_FeeCollectionStatisticsDto>(this, _$identity);
}

abstract class _FeeCollectionStatisticsDto extends FeeCollectionStatisticsDto {
  factory _FeeCollectionStatisticsDto(
      {required final String name,
      required final int reg,
      required final int feeAmt,
      required final List<int> feesPaid,
      required final int totalPaid,
      required final int balance}) = _$_FeeCollectionStatisticsDto;
  _FeeCollectionStatisticsDto._() : super._();

  @override
  String get name;
  @override
  int get reg;
  @override
  int get feeAmt;
  @override
  List<int> get feesPaid;
  @override
  int get totalPaid;
  @override
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$_FeeCollectionStatisticsDtoCopyWith<_$_FeeCollectionStatisticsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExpenseStatisticsDto {
  String get name => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseStatisticsDtoCopyWith<ExpenseStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStatisticsDtoCopyWith<$Res> {
  factory $ExpenseStatisticsDtoCopyWith(ExpenseStatisticsDto value,
          $Res Function(ExpenseStatisticsDto) then) =
      _$ExpenseStatisticsDtoCopyWithImpl<$Res>;
  $Res call({String name, String comment, int amount, int date});
}

/// @nodoc
class _$ExpenseStatisticsDtoCopyWithImpl<$Res>
    implements $ExpenseStatisticsDtoCopyWith<$Res> {
  _$ExpenseStatisticsDtoCopyWithImpl(this._value, this._then);

  final ExpenseStatisticsDto _value;
  // ignore: unused_field
  final $Res Function(ExpenseStatisticsDto) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? comment = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ExpenseStatisticsDtoCopyWith<$Res>
    implements $ExpenseStatisticsDtoCopyWith<$Res> {
  factory _$$_ExpenseStatisticsDtoCopyWith(_$_ExpenseStatisticsDto value,
          $Res Function(_$_ExpenseStatisticsDto) then) =
      __$$_ExpenseStatisticsDtoCopyWithImpl<$Res>;
  @override
  $Res call({String name, String comment, int amount, int date});
}

/// @nodoc
class __$$_ExpenseStatisticsDtoCopyWithImpl<$Res>
    extends _$ExpenseStatisticsDtoCopyWithImpl<$Res>
    implements _$$_ExpenseStatisticsDtoCopyWith<$Res> {
  __$$_ExpenseStatisticsDtoCopyWithImpl(_$_ExpenseStatisticsDto _value,
      $Res Function(_$_ExpenseStatisticsDto) _then)
      : super(_value, (v) => _then(v as _$_ExpenseStatisticsDto));

  @override
  _$_ExpenseStatisticsDto get _value => super._value as _$_ExpenseStatisticsDto;

  @override
  $Res call({
    Object? name = freezed,
    Object? comment = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_ExpenseStatisticsDto(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ExpenseStatisticsDto extends _ExpenseStatisticsDto {
  const _$_ExpenseStatisticsDto(
      {required this.name,
      required this.comment,
      required this.amount,
      required this.date})
      : super._();

  @override
  final String name;
  @override
  final String comment;
  @override
  final int amount;
  @override
  final int date;

  @override
  String toString() {
    return 'ExpenseStatisticsDto(name: $name, comment: $comment, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseStatisticsDto &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ExpenseStatisticsDtoCopyWith<_$_ExpenseStatisticsDto> get copyWith =>
      __$$_ExpenseStatisticsDtoCopyWithImpl<_$_ExpenseStatisticsDto>(
          this, _$identity);
}

abstract class _ExpenseStatisticsDto extends ExpenseStatisticsDto {
  const factory _ExpenseStatisticsDto(
      {required final String name,
      required final String comment,
      required final int amount,
      required final int date}) = _$_ExpenseStatisticsDto;
  const _ExpenseStatisticsDto._() : super._();

  @override
  String get name;
  @override
  String get comment;
  @override
  int get amount;
  @override
  int get date;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseStatisticsDtoCopyWith<_$_ExpenseStatisticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
