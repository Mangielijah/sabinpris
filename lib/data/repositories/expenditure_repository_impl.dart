import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/datasource/expenditure_datasource.dart';
import 'package:sabinpris/data/datasource/std_record_datasource.dart';
import 'package:sabinpris/data/models/expenditure_dto.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:sabinpris/domain/repositories/expenditure_repository.dart';

@Singleton(as: ExpenditureRepository)
class ExpenditureRepositoryImpl extends ExpenditureRepository {
  StudentRecordDataSource studentRecorddataSource;
  ExpenditureDataSource expenditureDataSource;
  ExpenditureRepositoryImpl(
      this.expenditureDataSource, this.studentRecorddataSource);
  @override
  Future<Expenditure> addExpenditure(Expenditure record) async {
    try {
      final expenditure = ExpenditureDto.fromDomain(record);
      final registeredExpenditure =
          await expenditureDataSource.addNewExpenditure(expenditure);
      return registeredExpenditure.toDomain();
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Future<List<ExpenseStatistics>> getExpenseStatistics(
      ExpenditureReportTypes reportType) async {
    if (reportType == ExpenditureReportTypes.General_Report) {
      return (await expenditureDataSource.getGeneralExpenseReport(SCHOOL_YEAR))
          .map((e) => e.toDomain())
          .toList();
    } else if (reportType == ExpenditureReportTypes.Salary_Report) {
      return (await expenditureDataSource.getSalaryExpenseReport(SCHOOL_YEAR))
          .map((e) => e.toDomain())
          .toList();
    } else {
      return (await expenditureDataSource.getOtherExpenseReport(SCHOOL_YEAR))
          .map((e) => e.toDomain())
          .toList();
    }
  }

  @override
  Stream<int> totalAmountLeft(String year) async* {
    try {
      final totLeft = expenditureDataSource.totalAmountLeft(year);
      yield* totLeft;
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Stream<int> totalAmountSpentOnExpenditures(String year) async* {
    try {
      final totSpent =
          expenditureDataSource.totalAmountSpentOnExpenditures(year);
      yield* totSpent;
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Future<String> exportExpenditures() async {
    try {
      final r = await expenditureDataSource.exportExpenditure();

      if (r != null) {
        return 'completed';
      } else {
        return 'failed';
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> importExpenditureRecord(
      List<Map<String, dynamic>> data) async {
    try {
      final r = (await expenditureDataSource.importExpenditures(data));

      if (r != null) {
        return 'completed';
      } else {
        return 'failed';
      }
    } catch (e) {
      debugPrint(e.toString());
      return 'failed';
    }
  }
}
