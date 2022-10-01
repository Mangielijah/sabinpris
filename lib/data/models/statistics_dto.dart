import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sabinpris/domain/entity/statistics.dart';

part 'statistics_dto.freezed.dart';

@freezed
class GeneralStatisticsDto with _$GeneralStatisticsDto {
  const GeneralStatisticsDto._();
  factory GeneralStatisticsDto({
    required String description,
    required int roll,
    required int feesDue,
    required int registration,
    required int feesPaid,
    required int totalIncome,
    required int balance,
  }) = _GeneralStatisticsDto;

  GeneralStatistics toDomain() {
    return GeneralStatistics(
      description: description,
      roll: roll,
      feesDue: feesDue,
      registration: registration,
      feesPaid: feesPaid,
      totalIncome: totalIncome,
      balance: balance,
    );
  }
}

@freezed
class FeeCollectionStatisticsDto with _$FeeCollectionStatisticsDto {
  const FeeCollectionStatisticsDto._();
  factory FeeCollectionStatisticsDto({
    required String name,
    required int reg,
    required int feeAmt,
    required List<int> feesPaid,
    required int totalPaid,
    required int balance,
  }) = _FeeCollectionStatisticsDto;

  FeeCollectionStatistics toDomain() {
    return FeeCollectionStatistics(
      name: name,
      reg: reg,
      feeAmt: feeAmt,
      feesPaid: feesPaid,
      totalPaid: totalPaid,
      balance: balance,
    );
  }
}

@freezed
class ExpenseStatisticsDto with _$ExpenseStatisticsDto {
  const ExpenseStatisticsDto._();
  const factory ExpenseStatisticsDto({
    required String name,
    required String comment,
    required int amount,
    required int date,
  }) = _ExpenseStatisticsDto;

  ExpenseStatistics toDomain() {
    return ExpenseStatistics(
      name: name,
      comment: comment,
      amount: amount,
      date: DateTime.fromMillisecondsSinceEpoch(date),
    );
  }
}
