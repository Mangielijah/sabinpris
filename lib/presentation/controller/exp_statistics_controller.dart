import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/repositories/expenditure_repository.dart';
import 'package:sabinpris/presentation/pdf_util.dart';
import 'package:sabinpris/service_locator.dart';

class ExpStatistics extends ChangeNotifier {
  ExpStatistics() {
    _reportType = ExpenditureReportTypes.General_Report;
    _search();
  }

  late ExpenditureReportTypes _reportType;

  bool isLoading = false;
  List<ExpenseStatistics> expenditureStats = [];
  ExpenseStatistics totalStats = ExpenseStatistics(
    comment: '',
    name: '',
    amount: 0,
    date: DateTime.now(),
  );

  void search(ExpenditureReportTypes type) {
    _reportType = type;
    _search();
  }

  Future<File> download() async {
    // if (_reportType == ExpenditureReportTypes.General_Report) {
    //   return await buildGeneralExpenditureSummary(
    //     expenditureStats,
    //     _reportType
    //   );
    // }
    return await buildGeneralExpenditureSummary(expenditureStats, _reportType);
  }

  Future _search() async {
    isLoading = true;
    notifyListeners();
    final result = await serviceLocator<ExpenditureRepository>()
        .getExpenseStatistics(_reportType);
    if (expenditureStats != result) {
      expenditureStats = [...result];
      if (result.isNotEmpty) {
        totalStats = result.reduce(
          (aStats, bStats) => ExpenseStatistics(
            name: 'Total',
            comment: '',
            amount: aStats.amount + bStats.amount,
            date: DateTime.now(),
          ),
        );
      } else {
        totalStats = ExpenseStatistics(
          comment: '',
          name: '',
          amount: 0,
          date: DateTime.now(),
        );
      }
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
