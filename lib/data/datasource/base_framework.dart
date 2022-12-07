import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/models/expenditure_dto.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';

abstract class BaseFramework {
  BaseFramework() {
    _initIsar();
  }

  Isar? isar;

  late IsarCollection<StudentRecordDto> studentRecord;
  late IsarCollection<ExpenditureDto> expenditureRecord;
  late Stream<List<StudentRecordDto>> recordStream;

  Future<void> _initIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    isar ??= await Isar.open(
      [StudentRecordDtoSchema, ExpenditureDtoSchema],
      directory: appDocPath,
      name: databaseName,
    );
    studentRecord = isar!.studentRecordDtos;
    expenditureRecord = isar!.expenditureDtos;
    recordStream = studentRecord
        .filter()
        .academicYearEqualTo(SCHOOL_YEAR)
        .watch(fireImmediately: true)
        .asBroadcastStream();
  }
}
