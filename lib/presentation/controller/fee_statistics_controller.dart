// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/presentation/pdf_util.dart';
import 'package:sabinpris/service_locator.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';

class FeeStatistics extends ChangeNotifier {
  FeeStatistics() {
    _sector = LanguageSector.english;
    _class = StudentClass.preNusery;
    _search();
  }

  late LanguageSector _sector;
  late StudentClass _class;
  bool isLoading = false;

  List<FeeCollectionStatistics> studentsFeeStats = [];
  FeeCollectionStatistics totalStats = FeeCollectionStatistics(
      balance: 0, feeAmt: 0, feesPaid: [], reg: 0, name: '', totalPaid: 0);
  void search(LanguageSector sector, StudentClass sclass) {
    _sector = sector;
    _class = sclass;
    _search();
  }

  Future<File> download() async {
    return await buildFeeCollectionSummary(studentsFeeStats, _sector, _class);
  }

  Future _search() async {
    isLoading = true;
    notifyListeners();
    final result = await serviceLocator<StudentRecordRepository>()
        .getFeeCollectionStatistics(
      _sector,
      _class,
    );
    if (studentsFeeStats != result) {
      studentsFeeStats = [...result];
      if (result.isNotEmpty) {
        totalStats = result.reduce(
          (aStats, bStats) => FeeCollectionStatistics(
            name: 'Total',
            reg: aStats.reg + bStats.reg,
            feeAmt: aStats.feeAmt + bStats.feeAmt,
            feesPaid: [...aStats.feesPaid, ...bStats.feesPaid],
            totalPaid: aStats.totalPaid + bStats.totalPaid,
            balance: aStats.balance + bStats.balance,
          ),
        );
      } else {
        totalStats = FeeCollectionStatistics(
            balance: 0,
            feeAmt: 0,
            feesPaid: [],
            reg: 0,
            name: '',
            totalPaid: 0);
      }
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
