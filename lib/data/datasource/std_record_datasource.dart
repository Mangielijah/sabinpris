import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/fee.dart';

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

  Future<List<StudentRecordDto>> searchStudents({
    required String year,
    required String fullName,
    required int sector,
    required int studentClass,
  }) async {
    try {
      late QueryBuilder<StudentRecordDto, StudentRecordDto,
              QAfterFilterCondition> studentSearchQuery =
          _studentRecord
              .filter()
              .academicYearEqualTo(year)
              .sectorEqualTo(sector)
              .studentClassEqualTo(studentClass);

      if (fullName.trim().isNotEmpty) {
        studentSearchQuery = studentSearchQuery.fullNameContains(
          fullName,
          caseSensitive: false,
        );
      }
      return await studentSearchQuery.findAll();
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

  Stream<int> numStudentWithCompleteFees(String year) async* {
    try {
      yield* _recordStream.map((recordList) {
        int count = 0;

        for (StudentRecordDto record in recordList) {
          //pre nursery
          if (record.studentClass == StudentClass.preNusery.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.preNusery) {
              count++;
            }
          }
          //nursery one
          if (record.studentClass == StudentClass.nuseryOne.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.nurseryOne) {
              count++;
            }
          }
          //nursery two
          if (record.studentClass == StudentClass.nuseryTwo.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.nurseryTwo) {
              count++;
            }
          }
          //class one
          if (record.studentClass == StudentClass.classOne.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classOne) {
              count++;
            }
          }
          //class two
          if (record.studentClass == StudentClass.classTwo.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classTwo) {
              count++;
            }
          }
          //class three
          if (record.studentClass == StudentClass.classThree.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classThree) {
              count++;
            }
          }
          //class four
          if (record.studentClass == StudentClass.classFour.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classFour) {
              count++;
            }
          }
          //class Five
          if (record.studentClass == StudentClass.classFive.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classFive) {
              count++;
            }
          }
          //class six
          if (record.studentClass == StudentClass.classSix.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees >= Fee.classSix) {
              count++;
            }
          }
        }

        return count;
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Stream<int> numStudentWithInCompleteFees(String year) async* {
    try {
      yield* _recordStream.map((recordList) {
        int count = 0;
        for (StudentRecordDto record in recordList) {
          //pre nursery
          if (record.studentClass == StudentClass.preNusery.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.preNusery) {
              count++;
            }
          }
          //nursery one
          if (record.studentClass == StudentClass.nuseryOne.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.nurseryOne) {
              count++;
            }
          }
          //nursery two
          if (record.studentClass == StudentClass.nuseryTwo.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.nurseryTwo) {
              count++;
            }
          }
          //class one
          if (record.studentClass == StudentClass.classOne.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classOne) {
              count++;
            }
          }
          //class two
          if (record.studentClass == StudentClass.classTwo.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classTwo) {
              count++;
            }
          }
          //class three
          if (record.studentClass == StudentClass.classThree.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classThree) {
              count++;
            }
          }
          //class four
          if (record.studentClass == StudentClass.classFour.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classFour) {
              count++;
            }
          }
          //class Five
          if (record.studentClass == StudentClass.classFive.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classFive) {
              count++;
            }
          }
          //class six
          if (record.studentClass == StudentClass.classSix.index) {
            int paidFees = record.feesPaid.reduce((a, b) => a + b);
            if (paidFees < Fee.classSix) {
              count++;
            }
          }
        }
        return count;
      });
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
