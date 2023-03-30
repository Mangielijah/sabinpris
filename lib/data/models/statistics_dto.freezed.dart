// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$GeneralStatisticsDtoCopyWithImpl<$Res, GeneralStatisticsDto>;
  @useResult
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
class _$GeneralStatisticsDtoCopyWithImpl<$Res,
        $Val extends GeneralStatisticsDto>
    implements $GeneralStatisticsDtoCopyWith<$Res> {
  _$GeneralStatisticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? roll = null,
    Object? feesDue = null,
    Object? registration = null,
    Object? feesPaid = null,
    Object? totalIncome = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
      feesDue: null == feesDue
          ? _value.feesDue
          : feesDue // ignore: cast_nullable_to_non_nullable
              as int,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: null == feesPaid
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralStatisticsDtoCopyWith<$Res>
    implements $GeneralStatisticsDtoCopyWith<$Res> {
  factory _$$_GeneralStatisticsDtoCopyWith(_$_GeneralStatisticsDto value,
          $Res Function(_$_GeneralStatisticsDto) then) =
      __$$_GeneralStatisticsDtoCopyWithImpl<$Res>;
  @override
  @useResult
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
    extends _$GeneralStatisticsDtoCopyWithImpl<$Res, _$_GeneralStatisticsDto>
    implements _$$_GeneralStatisticsDtoCopyWith<$Res> {
  __$$_GeneralStatisticsDtoCopyWithImpl(_$_GeneralStatisticsDto _value,
      $Res Function(_$_GeneralStatisticsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? roll = null,
    Object? feesDue = null,
    Object? registration = null,
    Object? feesPaid = null,
    Object? totalIncome = null,
    Object? balance = null,
  }) {
    return _then(_$_GeneralStatisticsDto(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as int,
      feesDue: null == feesDue
          ? _value.feesDue
          : feesDue // ignore: cast_nullable_to_non_nullable
              as int,
      registration: null == registration
          ? _value.registration
          : registration // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: null == feesPaid
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as int,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
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
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.roll, roll) || other.roll == roll) &&
            (identical(other.feesDue, feesDue) || other.feesDue == feesDue) &&
            (identical(other.registration, registration) ||
                other.registration == registration) &&
            (identical(other.feesPaid, feesPaid) ||
                other.feesPaid == feesPaid) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, roll, feesDue,
      registration, feesPaid, totalIncome, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$FeeCollectionStatisticsDtoCopyWithImpl<$Res,
          FeeCollectionStatisticsDto>;
  @useResult
  $Res call(
      {String name,
      int reg,
      int feeAmt,
      List<int> feesPaid,
      int totalPaid,
      int balance});
}

/// @nodoc
class _$FeeCollectionStatisticsDtoCopyWithImpl<$Res,
        $Val extends FeeCollectionStatisticsDto>
    implements $FeeCollectionStatisticsDtoCopyWith<$Res> {
  _$FeeCollectionStatisticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? reg = null,
    Object? feeAmt = null,
    Object? feesPaid = null,
    Object? totalPaid = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg: null == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmt: null == feeAmt
          ? _value.feeAmt
          : feeAmt // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: null == feesPaid
          ? _value.feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  @useResult
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
    extends _$FeeCollectionStatisticsDtoCopyWithImpl<$Res,
        _$_FeeCollectionStatisticsDto>
    implements _$$_FeeCollectionStatisticsDtoCopyWith<$Res> {
  __$$_FeeCollectionStatisticsDtoCopyWithImpl(
      _$_FeeCollectionStatisticsDto _value,
      $Res Function(_$_FeeCollectionStatisticsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? reg = null,
    Object? feeAmt = null,
    Object? feesPaid = null,
    Object? totalPaid = null,
    Object? balance = null,
  }) {
    return _then(_$_FeeCollectionStatisticsDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg: null == reg
          ? _value.reg
          : reg // ignore: cast_nullable_to_non_nullable
              as int,
      feeAmt: null == feeAmt
          ? _value.feeAmt
          : feeAmt // ignore: cast_nullable_to_non_nullable
              as int,
      feesPaid: null == feesPaid
          ? _value._feesPaid
          : feesPaid // ignore: cast_nullable_to_non_nullable
              as List<int>,
      totalPaid: null == totalPaid
          ? _value.totalPaid
          : totalPaid // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
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
    if (_feesPaid is EqualUnmodifiableListView) return _feesPaid;
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reg, reg) || other.reg == reg) &&
            (identical(other.feeAmt, feeAmt) || other.feeAmt == feeAmt) &&
            const DeepCollectionEquality().equals(other._feesPaid, _feesPaid) &&
            (identical(other.totalPaid, totalPaid) ||
                other.totalPaid == totalPaid) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, reg, feeAmt,
      const DeepCollectionEquality().hash(_feesPaid), totalPaid, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$ExpenseStatisticsDtoCopyWithImpl<$Res, ExpenseStatisticsDto>;
  @useResult
  $Res call({String name, String comment, int amount, int date});
}

/// @nodoc
class _$ExpenseStatisticsDtoCopyWithImpl<$Res,
        $Val extends ExpenseStatisticsDto>
    implements $ExpenseStatisticsDtoCopyWith<$Res> {
  _$ExpenseStatisticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? comment = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseStatisticsDtoCopyWith<$Res>
    implements $ExpenseStatisticsDtoCopyWith<$Res> {
  factory _$$_ExpenseStatisticsDtoCopyWith(_$_ExpenseStatisticsDto value,
          $Res Function(_$_ExpenseStatisticsDto) then) =
      __$$_ExpenseStatisticsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String comment, int amount, int date});
}

/// @nodoc
class __$$_ExpenseStatisticsDtoCopyWithImpl<$Res>
    extends _$ExpenseStatisticsDtoCopyWithImpl<$Res, _$_ExpenseStatisticsDto>
    implements _$$_ExpenseStatisticsDtoCopyWith<$Res> {
  __$$_ExpenseStatisticsDtoCopyWithImpl(_$_ExpenseStatisticsDto _value,
      $Res Function(_$_ExpenseStatisticsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? comment = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$_ExpenseStatisticsDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, comment, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
