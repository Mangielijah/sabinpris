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
  }) = _GeneralStatistics;
}
