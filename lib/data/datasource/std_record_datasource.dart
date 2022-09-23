import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';

@Singleton()
class StudentRecordDataSource {
  StudentRecordDataSource() {
    _initIsar();
  }

  Isar? _isar;
  late IsarCollection<StudentRecordDto> _studentRecord;
  late Stream<List<StudentRecordDto>> _recordStream;

  Future<void> _initIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    _isar ??= await Isar.open(
      [StudentRecordDtoSchema],
      directory: appDocPath,
    );
    _studentRecord = _isar!.studentRecordDtos;
    _recordStream = _studentRecord
        .filter()
        .academicYearEqualTo(SCHOOL_YEAR)
        .watch(fireImmediately: true)
        .asBroadcastStream();
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

  Stream<int> totalNumberOfStudents(String year) async* {
    try {
      yield* (_recordStream.map((r) => r.length));
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

  Stream<int> totalCollectedFees(String year) async* {
    try {
      yield* (_recordStream.map(
        (recordList) => (recordList
            .map((record) => record.feesPaid.reduce((a, b) => a + b))
            .toList()
            .reduce((c, d) => c + d)),
      ));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
