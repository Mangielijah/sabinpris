// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneralStatisticsCopyWith<GeneralStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralStatisticsCopyWith<$Res> {
  factory $GeneralStatisticsCopyWith(
          GeneralStatistics value, $Res Function(GeneralStatistics) then) =
      _$GeneralStatisticsCopyWithImpl<$Res, GeneralStatistics>;
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
class _$GeneralStatisticsCopyWithImpl<$Res, $Val extends GeneralStatistics>
    implements $GeneralStatisticsCopyWith<$Res> {
  _$GeneralStatisticsCopyWithImpl(this._value, this._then);

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
abstract class _$$_GeneralStatisticsCopyWith<$Res>
    implements $GeneralStatisticsCopyWith<$Res> {
  factory _$$_GeneralStatisticsCopyWith(_$_GeneralStatistics value,
          $Res Function(_$_GeneralStatistics) then) =
      __$$_GeneralStatisticsCopyWithImpl<$Res>;
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
class __$$_GeneralStatisticsCopyWithImpl<$Res>
    extends _$GeneralStatisticsCopyWithImpl<$Res, _$_GeneralStatistics>
    implements _$$_GeneralStatisticsCopyWith<$Res> {
  __$$_GeneralStatisticsCopyWithImpl(
      _$_GeneralStatistics _value, $Res Function(_$_GeneralStatistics) _then)
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
    return _then(_$_GeneralStatistics(
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

class _$_GeneralStatistics extends _GeneralStatistics {
  _$_GeneralStatistics(
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
    return 'GeneralStatistics(description: $description, roll: $roll, feesDue: $feesDue, registration: $registration, feesPaid: $feesPaid, totalIncome: $totalIncome, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralStatistics &&
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
      required final int totalIncome,
      required final int balance}) = _$_GeneralStatistics;
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
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralStatisticsCopyWith<_$_GeneralStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeeCollectionStatistics {
  String get name => throw _privateConstructorUsedError;
  int get reg => throw _privateConstructorUsedError;
  int get feeAmt => throw _privateConstructorUsedError;
  List<int> get feesPaid => throw _privateConstructorUsedError;
  int get totalPaid => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeeCollectionStatisticsCopyWith<FeeCollectionStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeCollectionStatisticsCopyWith<$Res> {
  factory $FeeCollectionStatisticsCopyWith(FeeCollectionStatistics value,
          $Res Function(FeeCollectionStatistics) then) =
      _$FeeCollectionStatisticsCopyWithImpl<$Res, FeeCollectionStatistics>;
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
class _$FeeCollectionStatisticsCopyWithImpl<$Res,
        $Val extends FeeCollectionStatistics>
    implements $FeeCollectionStatisticsCopyWith<$Res> {
  _$FeeCollectionStatisticsCopyWithImpl(this._value, this._then);

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
abstract class _$$_FeeCollectionStatisticsCopyWith<$Res>
    implements $FeeCollectionStatisticsCopyWith<$Res> {
  factory _$$_FeeCollectionStatisticsCopyWith(_$_FeeCollectionStatistics value,
          $Res Function(_$_FeeCollectionStatistics) then) =
      __$$_FeeCollectionStatisticsCopyWithImpl<$Res>;
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
class __$$_FeeCollectionStatisticsCopyWithImpl<$Res>
    extends _$FeeCollectionStatisticsCopyWithImpl<$Res,
        _$_FeeCollectionStatistics>
    implements _$$_FeeCollectionStatisticsCopyWith<$Res> {
  __$$_FeeCollectionStatisticsCopyWithImpl(_$_FeeCollectionStatistics _value,
      $Res Function(_$_FeeCollectionStatistics) _then)
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
    return _then(_$_FeeCollectionStatistics(
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

class _$_FeeCollectionStatistics extends _FeeCollectionStatistics {
  _$_FeeCollectionStatistics(
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
    return 'FeeCollectionStatistics(name: $name, reg: $reg, feeAmt: $feeAmt, feesPaid: $feesPaid, totalPaid: $totalPaid, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeeCollectionStatistics &&
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
  _$$_FeeCollectionStatisticsCopyWith<_$_FeeCollectionStatistics>
      get copyWith =>
          __$$_FeeCollectionStatisticsCopyWithImpl<_$_FeeCollectionStatistics>(
              this, _$identity);
}

abstract class _FeeCollectionStatistics extends FeeCollectionStatistics {
  factory _FeeCollectionStatistics(
      {required final String name,
      required final int reg,
      required final int feeAmt,
      required final List<int> feesPaid,
      required final int totalPaid,
      required final int balance}) = _$_FeeCollectionStatistics;
  _FeeCollectionStatistics._() : super._();

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
  _$$_FeeCollectionStatisticsCopyWith<_$_FeeCollectionStatistics>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExpenseStatistics {
  String get name => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseStatisticsCopyWith<ExpenseStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseStatisticsCopyWith<$Res> {
  factory $ExpenseStatisticsCopyWith(
          ExpenseStatistics value, $Res Function(ExpenseStatistics) then) =
      _$ExpenseStatisticsCopyWithImpl<$Res, ExpenseStatistics>;
  @useResult
  $Res call({String name, String comment, int amount, DateTime date});
}

/// @nodoc
class _$ExpenseStatisticsCopyWithImpl<$Res, $Val extends ExpenseStatistics>
    implements $ExpenseStatisticsCopyWith<$Res> {
  _$ExpenseStatisticsCopyWithImpl(this._value, this._then);

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
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseStatisticsCopyWith<$Res>
    implements $ExpenseStatisticsCopyWith<$Res> {
  factory _$$_ExpenseStatisticsCopyWith(_$_ExpenseStatistics value,
          $Res Function(_$_ExpenseStatistics) then) =
      __$$_ExpenseStatisticsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String comment, int amount, DateTime date});
}

/// @nodoc
class __$$_ExpenseStatisticsCopyWithImpl<$Res>
    extends _$ExpenseStatisticsCopyWithImpl<$Res, _$_ExpenseStatistics>
    implements _$$_ExpenseStatisticsCopyWith<$Res> {
  __$$_ExpenseStatisticsCopyWithImpl(
      _$_ExpenseStatistics _value, $Res Function(_$_ExpenseStatistics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? comment = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$_ExpenseStatistics(
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
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ExpenseStatistics implements _ExpenseStatistics {
  const _$_ExpenseStatistics(
      {required this.name,
      required this.comment,
      required this.amount,
      required this.date});

  @override
  final String name;
  @override
  final String comment;
  @override
  final int amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ExpenseStatistics(name: $name, comment: $comment, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseStatistics &&
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
  _$$_ExpenseStatisticsCopyWith<_$_ExpenseStatistics> get copyWith =>
      __$$_ExpenseStatisticsCopyWithImpl<_$_ExpenseStatistics>(
          this, _$identity);
}

abstract class _ExpenseStatistics implements ExpenseStatistics {
  const factory _ExpenseStatistics(
      {required final String name,
      required final String comment,
      required final int amount,
      required final DateTime date}) = _$_ExpenseStatistics;

  @override
  String get name;
  @override
  String get comment;
  @override
  int get amount;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseStatisticsCopyWith<_$_ExpenseStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}
