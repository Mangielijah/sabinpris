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

  Future<StudentRecordDto> updateFees(int recordId, int fees) {
    throw UnimplementedError();
  }
}
