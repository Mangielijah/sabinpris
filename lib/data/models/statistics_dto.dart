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
  }) = _GeneralStatisticsDto;

  GeneralStatistics toDomain() {
    return GeneralStatistics(
      description: description,
      roll: roll,
      feesDue: feesDue,
      registration: registration,
      feesPaid: feesPaid,
      totalIncome: totalIncome,
    );
  }
}
