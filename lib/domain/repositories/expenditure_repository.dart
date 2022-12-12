import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:sabinpris/domain/entity/statistics.dart';

abstract class ExpenditureRepository {
  Future<Expenditure> addExpenditure(Expenditure record);
  Stream<int> totalAmountSpentOnExpenditures(String year);
  Stream<int> totalAmountLeft(String year);
  Future<List<ExpenseStatistics>> getExpenseStatistics(
      ExpenditureReportTypes reportType);
  Future<String> exportExpenditures();
  Future<String> importExpenditureRecord(List<Map<String, dynamic>> data);
}
