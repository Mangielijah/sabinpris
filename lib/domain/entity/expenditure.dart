import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenditure.freezed.dart';

enum ExpenditureType {
  Salaries,
  Repairs_and_Maintenance,
  CNPs_and_Taxes,
  Public_Relations,
  Nursery_Feeding,
  Dues_and_Registration,
  Other
}

enum ExpenditureReportTypes { General_Report, Salary_Report, Others }

@freezed
class Expenditure with _$Expenditure {
  const factory Expenditure({
    int? id,
    required String academicYear,
    required ExpenditureType expenseType,
    required int amount,
    required String comment,
    required DateTime time,
  }) = _Expenditure;
}

extension ExpenditureTypeExt on ExpenditureType {
  String get name => (toString().split('.')[1]).replaceAll('_', ' ');
}

extension ExpenditureReportTypesExt on ExpenditureReportTypes {
  String get name => (toString().split('.')[1]).replaceAll('_', ' ');
}
