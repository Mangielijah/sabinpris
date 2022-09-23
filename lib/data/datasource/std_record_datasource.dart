import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';

@Singleton()
class StudentRecordDataSource {
  StudentRecordDataSource() {
    _initIsar();
  }

  Isar? _isar;
  late IsarCollection<StudentRecordDto> _studentRecord;

  Future<void> _initIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    _isar ??= await Isar.open(
      [StudentRecordDtoSchema],
      directory: appDocPath,
    );
    _studentRecord = _isar!.studentRecordDtos;
  }

  Future<StudentRecordDto> registerStudent(StudentRecordDto record) async {
    try {
      return await _isar!.writeTxn<StudentRecordDto>(() async {
        record.recordId = await _studentRecord.put(record);
        return record;
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<int> totalNumberOfStudents(String year) async {
    try {
      return (await _studentRecord.filter().academicYearEqualTo(year).findAll())
          .length;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<StudentRecordDto> updateFees(int recordId, int fees) async {
    try {
      return await _isar!.writeTxn<StudentRecordDto>(() async {
        final record = await _studentRecord.get(recordId);
        final cFees = [...record!.feesPaid];
        record.feesPaid = [...cFees, fees];
        await _studentRecord.put(record); // perform update operations
        return record;
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<int> totalCollectedFees(String year) async {
    try {
      return (await _studentRecord.filter().academicYearEqualTo(year).findAll())
          .map((record) => record.feesPaid.reduce((a, b) => a + b))
          .toList()
          .reduce((c, d) => c + d);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
