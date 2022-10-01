import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';

@freezed
class GeneralStatistics with _$GeneralStatistics {
  const GeneralStatistics._();
  factory GeneralStatistics({
    required String description,
    required int roll,
    required int feesDue,
    required int registration,
    required int feesPaid,
    required int totalIncome,
    required int balance,
  }) = _GeneralStatistics;
}

@freezed
class FeeCollectionStatistics with _$FeeCollectionStatistics {
  const FeeCollectionStatistics._();
  factory FeeCollectionStatistics({
    required String name,
    required int reg,
    required int feeAmt,
    required List<int> feesPaid,
    required int totalPaid,
    required int balance,
  }) = _FeeCollectionStatistics;
}

@freezed
class ExpenseStatistics with _$ExpenseStatistics {
  const factory ExpenseStatistics({
    required String name,
    required String comment,
    required int amount,
    required DateTime date,
  }) = _ExpenseStatistics;
}
