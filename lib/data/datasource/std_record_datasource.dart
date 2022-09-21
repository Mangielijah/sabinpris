import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';

@LazySingleton()
class StudentRecordDataSource {
  StudentRecordDataSource() {
    _initIsar();
  }

  Isar? _isar;
  late IsarCollection<StudentRecordDto> _studentRecord;

  Future<void> _initIsar() async {
    _isar ??= await Isar.open(
      [StudentRecordDtoSchema],
      directory: 'database/studentRecords',
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
