// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expenditure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Expenditure {
  int? get id => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;
  ExpenditureType get expenseType => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenditureCopyWith<Expenditure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenditureCopyWith<$Res> {
  factory $ExpenditureCopyWith(
          Expenditure value, $Res Function(Expenditure) then) =
      _$ExpenditureCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String academicYear,
      ExpenditureType expenseType,
      int amount,
      String comment,
      DateTime time});
}

/// @nodoc
class _$ExpenditureCopyWithImpl<$Res> implements $ExpenditureCopyWith<$Res> {
  _$ExpenditureCopyWithImpl(this._value, this._then);

  final Expenditure _value;
  // ignore: unused_field
  final $Res Function(Expenditure) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? academicYear = freezed,
    Object? expenseType = freezed,
    Object? amount = freezed,
    Object? comment = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academicYear: academicYear == freezed
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      expenseType: expenseType == freezed
          ? _value.expenseType
          : expenseType // ignore: cast_nullable_to_non_nullable
              as ExpenditureType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_ExpenditureCopyWith<$Res>
    implements $ExpenditureCopyWith<$Res> {
  factory _$$_ExpenditureCopyWith(
          _$_Expenditure value, $Res Function(_$_Expenditure) then) =
      __$$_ExpenditureCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String academicYear,
      ExpenditureType expenseType,
      int amount,
      String comment,
      DateTime time});
}

/// @nodoc
class __$$_ExpenditureCopyWithImpl<$Res> extends _$ExpenditureCopyWithImpl<$Res>
    implements _$$_ExpenditureCopyWith<$Res> {
  __$$_ExpenditureCopyWithImpl(
      _$_Expenditure _value, $Res Function(_$_Expenditure) _then)
      : super(_value, (v) => _then(v as _$_Expenditure));

  @override
  _$_Expenditure get _value => super._value as _$_Expenditure;

  @override
  $Res call({
    Object? id = freezed,
    Object? academicYear = freezed,
    Object? expenseType = freezed,
    Object? amount = freezed,
    Object? comment = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Expenditure(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      academicYear: academicYear == freezed
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      expenseType: expenseType == freezed
          ? _value.expenseType
          : expenseType // ignore: cast_nullable_to_non_nullable
              as ExpenditureType,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Expenditure implements _Expenditure {
  const _$_Expenditure(
      {this.id,
      required this.academicYear,
      required this.expenseType,
      required this.amount,
      required this.comment,
      required this.time});

  @override
  final int? id;
  @override
  final String academicYear;
  @override
  final ExpenditureType expenseType;
  @override
  final int amount;
  @override
  final String comment;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'Expenditure(id: $id, academicYear: $academicYear, expenseType: $expenseType, amount: $amount, comment: $comment, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Expenditure &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.academicYear, academicYear) &&
            const DeepCollectionEquality()
                .equals(other.expenseType, expenseType) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(academicYear),
      const DeepCollectionEquality().hash(expenseType),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_ExpenditureCopyWith<_$_Expenditure> get copyWith =>
      __$$_ExpenditureCopyWithImpl<_$_Expenditure>(this, _$identity);
}

abstract class _Expenditure implements Expenditure {
  const factory _Expenditure(
      {final int? id,
      required final String academicYear,
      required final ExpenditureType expenseType,
      required final int amount,
      required final String comment,
      required final DateTime time}) = _$_Expenditure;

  @override
  int? get id;
  @override
  String get academicYear;
  @override
  ExpenditureType get expenseType;
  @override
  int get amount;
  @override
  String get comment;
  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenditureCopyWith<_$_Expenditure> get copyWith =>
      throw _privateConstructorUsedError;
}
