import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/datasource/base_framework.dart';
import 'package:sabinpris/data/models/expenditure_dto.dart';
import 'package:sabinpris/data/models/statistics_dto.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:sabinpris/fee.dart';

@Singleton()
class ExpenditureDataSource extends BaseFramework {
  ExpenditureDataSource();

  Future<String> exportExpenditure() async {
    try {
      List<Map<String, dynamic>> json =
          await isar!.expenditureDtos.buildQuery().exportJson();
      Uint8List fileContent = Uint8List.fromList(jsonEncode(json).codeUnits);
      String filename =
          'sabinpris-expenditure${DateTime.now().millisecondsSinceEpoch}';
      return FileSaver.instance.saveFile(filename, fileContent, 'json');
    } catch (e) {
      rethrow;
    }
  }

  Future<String> importExpenditures(List<Map<String, dynamic>> data) async {
    try {
      await isar!.expenditureDtos.clear();
      await isar!.expenditureDtos.importJson(data);
      if (data.isNotEmpty) {
        if (await isar!.expenditureDtos.count() > 0) {
          return 'completed';
        } else {
          return 'failed';
        }
      } else {
        return 'completed';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ExpenditureDto> addNewExpenditure(ExpenditureDto exp) async {
    try {
      return await isar!.writeTxn<ExpenditureDto>(() async {
        exp.id = await expenditureRecord.put(exp);
        return exp;
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<ExpenseStatisticsDto>> getGeneralExpenseReport(
      String year) async {
    final totalIncome =
        (await studentRecord.filter().academicYearEqualTo(year).findAll())
            .map((e) => (e.paidRegistration)
                ? Fee.regFee + e.feesPaid.reduce((a, b) => a + b)
                : e.feesPaid.reduce((a, b) => a + b))
            .toList()
            .reduce((c, d) => c + d);
    List<ExpenseStatisticsDto> stats = [];
    //SALARY
    final salaryList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Salaries.index)
        .findAll();
    int totalSalary = 0;
    if (salaryList.isNotEmpty) {
      totalSalary = salaryList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'Nursery & Primary Salaries',
      comment: 'Total Salaries Paid',
      amount: totalSalary,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //REPAIR AND MAINTENANCE
    final repairsList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Repairs_and_Maintenance.index)
        .findAll();
    int totalRepairs = 0;
    if (repairsList.isNotEmpty) {
      totalRepairs = repairsList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'Repairs and Maintenance',
      comment: 'Total Repairs and Maintenance',
      amount: totalRepairs,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //CNPS and TAXES
    final taxesList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.CNPs_and_Taxes.index)
        .findAll();
    int totalTaxes = 0;
    if (taxesList.isNotEmpty) {
      totalTaxes = taxesList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'CNPS and TAXES',
      comment: 'Total CNPS and TAXES PAID',
      amount: totalTaxes,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //PUBLIC RELATIONS
    final prList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Public_Relations.index)
        .findAll();
    int totalPR = 0;
    if (prList.isNotEmpty) {
      totalPR = prList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'PUBLIC RELATION',
      comment: 'Total Spent on Public Relation',
      amount: totalPR,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //Nursery Feeding
    final feedingList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Nursery_Feeding.index)
        .findAll();
    int totalFeeding = 0;
    if (feedingList.isNotEmpty) {
      totalFeeding = feedingList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'Nursery Feeding',
      comment: 'Total Spent on Nursery Feeding',
      amount: totalFeeding,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //Dues and Registration
    final duesRegList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Dues_and_Registration.index)
        .findAll();
    int totalDR = 0;
    if (duesRegList.isNotEmpty) {
      totalDR = duesRegList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'Dues and Registration',
      comment: 'Total Spent on Dues and Registration',
      amount: totalDR,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    //Dues and Registration
    final othersList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Other.index)
        .findAll();
    int totalOthers = 0;
    if (othersList.isNotEmpty) {
      totalOthers = othersList.map((e) => e.amount).reduce((a, b) => a + b);
    }
    stats.add(ExpenseStatisticsDto(
      name: 'Others',
      comment: 'Total Spent on Other Expense',
      amount: totalOthers,
      date: DateTime.now().millisecondsSinceEpoch,
    ));
    final totalExpenses = totalOthers +
        totalDR +
        totalFeeding +
        totalPR +
        totalTaxes +
        totalRepairs +
        totalSalary;
    stats.add(ExpenseStatisticsDto(
      name: 'TOTAL EXPENSES',
      comment: 'Total Cost for Expenditures',
      amount: totalExpenses,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    stats.add(ExpenseStatisticsDto(
      name: 'Balance C/D',
      comment: 'Balance after Expenditures',
      amount: totalIncome - totalExpenses,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    stats.add(ExpenseStatisticsDto(
      name: 'GRAND TOTAL',
      comment: 'total income',
      amount: totalIncome,
      date: DateTime.now().millisecondsSinceEpoch,
    ));

    return stats;
  }

  Future<List<ExpenseStatisticsDto>> getSalaryExpenseReport(String year) async {
    List<ExpenseStatisticsDto> stats = [];
    //SALARY
    final salaryList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeEqualTo(ExpenditureType.Salaries.index)
        .findAll();
    if (salaryList.isNotEmpty) {
      final sl = salaryList
          .map((e) => ExpenseStatisticsDto(
                name: 'Paid salary',
                comment: e.comment ?? '',
                amount: e.amount,
                date: e.time,
              ))
          .toList();
      stats.addAll(sl);
    }
    return stats;
  }

  Future<List<ExpenseStatisticsDto>> getOtherExpenseReport(String year) async {
    List<ExpenseStatisticsDto> stats = [];
    //SALARY
    final expenseList = await expenditureRecord
        .filter()
        .academicYearEqualTo(year)
        .expenseTypeGreaterThan(ExpenditureType.Salaries.index)
        .findAll();
    if (expenseList.isNotEmpty) {
      final el = expenseList.map((e) {
        String name = ExpenditureType.values[e.expenseType].name;
        return ExpenseStatisticsDto(
          name: name,
          comment: e.comment ?? '',
          amount: e.amount,
          date: e.time,
        );
      }).toList();
      stats.addAll(el);
    }
    return stats;
  }

  Stream<int> totalAmountSpentOnExpenditures(String year) async* {
    try {
      yield* (expenditureRecord
          .filter()
          .academicYearEqualTo(SCHOOL_YEAR)
          .watch(fireImmediately: true)
          .asBroadcastStream()
          .map(
            (expRecordList) => (expRecordList
                .map((expenditure) => expenditure.amount)
                .toList()
                .reduce((c, d) => c + d)),
          ));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<int> totalAmountLeft(String year) async* {
    try {
      final totalIncome =
          (await studentRecord.filter().academicYearEqualTo(year).findAll())
              .map((e) => (e.paidRegistration)
                  ? Fee.regFee + e.feesPaid.reduce((a, b) => a + b)
                  : e.feesPaid.reduce((a, b) => a + b))
              .toList()
              .reduce((c, d) => c + d);
      yield* (expenditureRecord
          .filter()
          .academicYearEqualTo(SCHOOL_YEAR)
          .watch(fireImmediately: true)
          .asBroadcastStream()
          .map(
            (expRecordList) =>
                totalIncome -
                (expRecordList
                    .map((expenditure) => expenditure.amount)
                    .toList()
                    .reduce((c, d) => c + d)),
          ));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
