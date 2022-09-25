import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/models/statistics_dto.dart';
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

  Future<List<GeneralStatisticsDto>> generateGeneralStatistics(
      String year) async {
    try {
      List<GeneralStatisticsDto> stats = [];
      //ENGLISH SECTION

      //NURSERY
      final nurseryList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(LanguageSector.english.index)
          .studentClassBetween(
              StudentClass.preNusery.index, StudentClass.nuseryTwo.index)
          .findAll();
      int totalEnroll = 0;
      int registration = 0;
      int feesPaid = 0;
      int feesDue = 0;
      int ptotalEnroll = 0;
      int pregistration = 0;
      int pfeesPaid = 0;
      int pfeesDue = 0;
      if (nurseryList.isNotEmpty) {
        totalEnroll = nurseryList.length;
        registration = nurseryList
            .map((e) => e.paidRegistration ? 5000 : 0)
            .reduce((a, b) => a + b);
        feesPaid = nurseryList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDue = nurseryList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
      }

      final totalIncome = feesPaid + registration;
      stats.add(GeneralStatisticsDto(
        description: 'NURSERY SECTION',
        roll: totalEnroll,
        feesDue: feesDue,
        registration: registration,
        feesPaid: feesPaid,
        totalIncome: totalIncome,
      ));
      //PRIMARY
      final primaryList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(LanguageSector.english.index)
          .studentClassBetween(
              StudentClass.classOne.index, StudentClass.classSix.index)
          .findAll();
      if (primaryList.isNotEmpty) {
        ptotalEnroll = primaryList.length;
        pregistration = primaryList
            .map((e) => e.paidRegistration ? 5000 : 0)
            .reduce((a, b) => a + b);
        pfeesPaid = primaryList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        pfeesDue = primaryList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
      }
      final ptotalIncome = pfeesPaid + pregistration;
      stats.add(GeneralStatisticsDto(
        description: 'PRIMARY SECTION',
        roll: ptotalEnroll,
        feesDue: pfeesDue,
        registration: pregistration,
        feesPaid: pfeesPaid,
        totalIncome: ptotalIncome,
      ));
      stats.add(GeneralStatisticsDto(
        description: 'TOTAL',
        roll: totalEnroll + ptotalEnroll,
        feesDue: feesDue + pfeesDue,
        registration: registration + pregistration,
        feesPaid: feesPaid + pfeesPaid,
        totalIncome: totalIncome + ptotalIncome,
      ));

      //FRENCH SECTION
      //NURSERY
      final fnurseryList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(LanguageSector.french.index)
          .studentClassBetween(
              StudentClass.preNusery.index, StudentClass.nuseryTwo.index)
          .findAll();
      int ftotalEnroll = 0;
      int fregistration = 0;
      int ffeesPaid = 0;
      int ffeesDue = 0;
      int fptotalEnroll = 0;
      int fpregistration = 0;
      int fpfeesPaid = 0;
      int fpfeesDue = 0;
      if (fnurseryList.isNotEmpty) {
        ftotalEnroll = fnurseryList.length;
        fregistration = fnurseryList
            .map((e) => e.paidRegistration ? 5000 : 0)
            .reduce((a, b) => a + b);
        ffeesPaid = fnurseryList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        ffeesDue = fnurseryList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
      }
      final ftotalIncome = ffeesPaid + fregistration;
      stats.add(GeneralStatisticsDto(
        description: 'SECTION MATERNELLE',
        roll: ftotalEnroll,
        feesDue: ffeesDue,
        registration: fregistration,
        feesPaid: ffeesPaid,
        totalIncome: ftotalIncome,
      ));

      //PRIMARY
      final fprimaryList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(LanguageSector.french.index)
          .studentClassBetween(
              StudentClass.classOne.index, StudentClass.classSix.index)
          .findAll();
      if (fprimaryList.isNotEmpty) {
        fptotalEnroll = fprimaryList.length;

        fpregistration = fprimaryList
            .map((e) => e.paidRegistration ? 5000 : 0)
            .reduce((a, b) => a + b);
        fpfeesPaid = fprimaryList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        fpfeesDue = fprimaryList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
      }
      final fptotalIncome = fpfeesPaid + fpregistration;
      stats.add(GeneralStatisticsDto(
        description: 'ECOLE PRIMAIRE',
        roll: fptotalEnroll,
        feesDue: fpfeesDue,
        registration: fpregistration,
        feesPaid: fpfeesPaid,
        totalIncome: fptotalIncome,
      ));
      stats.add(GeneralStatisticsDto(
        description: 'TOTAL',
        roll: ftotalEnroll + fptotalEnroll,
        feesDue: ffeesDue + fpfeesDue,
        registration: fregistration + fpregistration,
        feesPaid: ffeesPaid + fpfeesPaid,
        totalIncome: ftotalIncome + fptotalIncome,
      ));
      stats.add(GeneralStatisticsDto(
        description: 'GRAND TOTAL',
        roll: totalEnroll + ptotalEnroll + ftotalEnroll + fptotalEnroll,
        feesDue: feesDue + pfeesDue + ffeesDue + fpfeesDue,
        registration:
            registration + pregistration + fregistration + fpregistration,
        feesPaid: feesPaid + pfeesPaid + ffeesPaid + fpfeesPaid,
        totalIncome: totalIncome + ptotalIncome + ftotalIncome + fptotalIncome,
      ));
      return stats;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  _getClassFee(StudentClass sclass) {
    if (sclass == StudentClass.preNusery) return Fee.preNusery;
    if (sclass == StudentClass.nuseryOne) return Fee.nurseryOne;
    if (sclass == StudentClass.nuseryTwo) return Fee.nurseryTwo;
    if (sclass == StudentClass.classOne) return Fee.classOne;
    if (sclass == StudentClass.classTwo) return Fee.classTwo;
    if (sclass == StudentClass.classThree) return Fee.classThree;
    if (sclass == StudentClass.classFour) return Fee.classFour;
    if (sclass == StudentClass.classFive) return Fee.classFive;
    if (sclass == StudentClass.classSix) return Fee.classSix;
  }
}
