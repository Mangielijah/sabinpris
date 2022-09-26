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
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
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
        balance: (feesPaid - feesDue).abs(),
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
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
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
        balance: (pfeesPaid - pfeesDue).abs(),
      ));
      stats.add(GeneralStatisticsDto(
        description: 'TOTAL',
        roll: totalEnroll + ptotalEnroll,
        feesDue: feesDue + pfeesDue,
        registration: registration + pregistration,
        feesPaid: feesPaid + pfeesPaid,
        totalIncome: totalIncome + ptotalIncome,
        balance: ((feesPaid + pfeesPaid) - (feesDue + pfeesDue)).abs(),
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
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
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
        balance: (ffeesPaid - ffeesDue).abs(),
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
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
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
        balance: (fpfeesPaid - fpfeesDue).abs(),
      ));
      stats.add(GeneralStatisticsDto(
        description: 'TOTAL',
        roll: ftotalEnroll + fptotalEnroll,
        feesDue: ffeesDue + fpfeesDue,
        registration: fregistration + fpregistration,
        feesPaid: ffeesPaid + fpfeesPaid,
        totalIncome: ftotalIncome + fptotalIncome,
        balance: ((ffeesPaid + fpfeesPaid) - (ffeesDue + fpfeesDue)).abs(),
      ));
      stats.add(GeneralStatisticsDto(
        description: 'GRAND TOTAL',
        roll: totalEnroll + ptotalEnroll + ftotalEnroll + fptotalEnroll,
        feesDue: feesDue + pfeesDue + ffeesDue + fpfeesDue,
        registration:
            registration + pregistration + fregistration + fpregistration,
        feesPaid: feesPaid + pfeesPaid + ffeesPaid + fpfeesPaid,
        totalIncome: totalIncome + ptotalIncome + ftotalIncome + fptotalIncome,
        balance: ((feesPaid + pfeesPaid + ffeesPaid + fpfeesPaid) -
                (feesDue + pfeesDue + ffeesDue + fpfeesDue))
            .abs(),
      ));
      return stats;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<GeneralStatisticsDto>> generateSectionSummaryStatistics(
      String year, int sector) async {
    try {
      List<GeneralStatisticsDto> stats = [];

      //NURSERY
      int totalEnrollPn = 0;
      int registrationPn = 0;
      int feesPaidPn = 0;
      int feesDuePn = 0;
      int balancePn = 0;

      final nurseryList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.preNusery.index)
          .findAll();

      if (nurseryList.isNotEmpty) {
        totalEnrollPn = nurseryList.length;
        registrationPn = nurseryList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidPn = nurseryList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDuePn = nurseryList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balancePn = (feesPaidPn - feesDuePn).abs();
      }

      final totalIncome = feesPaidPn + registrationPn;
      stats.add(GeneralStatisticsDto(
        description: (sector == 0) ? 'PRE NURSERY' : 'PRE MATERNELLE',
        roll: totalEnrollPn,
        feesDue: feesDuePn,
        registration: registrationPn,
        feesPaid: feesPaidPn,
        totalIncome: totalIncome,
        balance: balancePn,
      ));

      //NURSERY 1
      int totalEnrollN1 = 0;
      int registrationN1 = 0;
      int feesPaidN1 = 0;
      int feesDueN1 = 0;
      int balanceN1 = 0;

      final nurseryOneList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.nuseryOne.index)
          .findAll();

      if (nurseryOneList.isNotEmpty) {
        totalEnrollN1 = nurseryOneList.length;
        registrationN1 = nurseryOneList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidN1 = nurseryOneList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueN1 = nurseryOneList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceN1 = (feesPaidN1 - feesDueN1).abs();
      }

      final totalIncomeN1 = feesPaidN1 + registrationN1;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'NURSERY 1' : 'MATERNELLE 1',
          roll: totalEnrollN1,
          feesDue: feesDueN1,
          registration: registrationN1,
          feesPaid: feesPaidN1,
          totalIncome: totalIncomeN1,
          balance: balanceN1));

      //NURSERY 2
      int totalEnrollN2 = 0;
      int registrationN2 = 0;
      int feesPaidN2 = 0;
      int feesDueN2 = 0;
      int balanceN2 = 0;

      final nurserytwoList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.nuseryTwo.index)
          .findAll();

      if (nurserytwoList.isNotEmpty) {
        totalEnrollN2 = nurserytwoList.length;
        registrationN2 = nurserytwoList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidN2 = nurserytwoList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueN2 = nurserytwoList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceN2 = (feesPaidN2 - feesDueN2).abs();
      }

      final totalIncomeN2 = feesPaidN2 + registrationN2;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'NURSERY 2' : 'MATERNELLE 2',
          roll: totalEnrollN2,
          feesDue: feesDueN2,
          registration: registrationN2,
          feesPaid: feesPaidN2,
          totalIncome: totalIncomeN2,
          balance: balanceN2));

      //Class 1
      int totalEnrollC1 = 0;
      int registrationC1 = 0;
      int feesPaidC1 = 0;
      int feesDueC1 = 0;
      int balanceC1 = 0;

      final classOneList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classOne.index)
          .findAll();

      if (classOneList.isNotEmpty) {
        totalEnrollC1 = classOneList.length;
        registrationC1 = classOneList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC1 = classOneList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC1 = classOneList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC1 = (feesPaidC1 - feesDueC1).abs();
      }

      final totalIncomeC1 = feesPaidC1 + registrationC1;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'CLASS 1' : 'SIL',
          roll: totalEnrollC1,
          feesDue: feesDueC1,
          registration: registrationC1,
          feesPaid: feesPaidC1,
          totalIncome: totalIncomeC1,
          balance: balanceC1));

      //Class 2
      int totalEnrollC2 = 0;
      int registrationC2 = 0;
      int feesPaidC2 = 0;
      int feesDueC2 = 0;
      int balanceC2 = 0;

      final classTwoList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classTwo.index)
          .findAll();

      if (classTwoList.isNotEmpty) {
        totalEnrollC2 = classTwoList.length;
        registrationC2 = classTwoList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC2 = classTwoList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC2 = classTwoList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC2 = (feesPaidC2 - feesDueC2).abs();
      }

      final totalIncomeC2 = feesPaidC2 + registrationC2;
      stats.add(GeneralStatisticsDto(
        description: (sector == 0) ? 'CLASS 2' : 'CP',
        roll: totalEnrollC2,
        feesDue: feesDueC2,
        registration: registrationC2,
        feesPaid: feesPaidC2,
        totalIncome: totalIncomeC2,
        balance: balanceC2,
      ));

      //Class 3
      int totalEnrollC3 = 0;
      int registrationC3 = 0;
      int feesPaidC3 = 0;
      int feesDueC3 = 0;
      int balanceC3 = 0;

      final classThreeList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classThree.index)
          .findAll();

      if (classThreeList.isNotEmpty) {
        totalEnrollC3 = classThreeList.length;
        registrationC3 = classThreeList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC3 = classThreeList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC3 = classThreeList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC3 = (feesPaidC3 - feesDueC3).abs();
      }

      final totalIncomeC3 = feesPaidC3 + registrationC3;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'CLASS 3' : 'CE1',
          roll: totalEnrollC3,
          feesDue: feesDueC3,
          registration: registrationC3,
          feesPaid: feesPaidC3,
          totalIncome: totalIncomeC3,
          balance: balanceC3));

      //Class 4
      int totalEnrollC4 = 0;
      int registrationC4 = 0;
      int feesPaidC4 = 0;
      int feesDueC4 = 0;
      int balanceC4 = 0;

      final classFourList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classFour.index)
          .findAll();

      if (classFourList.isNotEmpty) {
        totalEnrollC4 = classFourList.length;
        registrationC4 = classFourList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC4 = classFourList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC4 = classFourList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC4 = (feesPaidC4 - feesDueC4).abs();
      }

      final totalIncomeC4 = feesPaidC4 + registrationC4;
      stats.add(GeneralStatisticsDto(
        description: (sector == 0) ? 'CLASS 4' : 'CE2',
        roll: totalEnrollC4,
        feesDue: feesDueC4,
        registration: registrationC4,
        feesPaid: feesPaidC4,
        totalIncome: totalIncomeC4,
        balance: balanceC4,
      ));

      //Class 5
      int totalEnrollC5 = 0;
      int registrationC5 = 0;
      int feesPaidC5 = 0;
      int feesDueC5 = 0;
      int balanceC5 = 0;

      final classFiveList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classFive.index)
          .findAll();

      if (classFiveList.isNotEmpty) {
        totalEnrollC5 = classFiveList.length;
        registrationC5 = classFiveList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC5 = classFiveList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC5 = classFiveList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC5 = (feesPaidC5 - feesDueC5).abs();
      }

      final totalIncomeC5 = feesPaidC5 + registrationC5;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'CLASS 5' : 'CM1',
          roll: totalEnrollC5,
          feesDue: feesDueC5,
          registration: registrationC5,
          feesPaid: feesPaidC5,
          totalIncome: totalIncomeC5,
          balance: balanceC5));

      //Class 6
      int totalEnrollC6 = 0;
      int registrationC6 = 0;
      int feesPaidC6 = 0;
      int feesDueC6 = 0;
      int balanceC6 = 0;

      final classSixList = await _studentRecord
          .filter()
          .academicYearEqualTo(year)
          .sectorEqualTo(sector)
          .studentClassEqualTo(StudentClass.classSix.index)
          .findAll();

      if (classSixList.isNotEmpty) {
        totalEnrollC6 = classSixList.length;
        registrationC6 = classSixList
            .map((e) => e.paidRegistration ? Fee.regFee : 0)
            .reduce((a, b) => a + b);
        feesPaidC6 = classSixList
            .map((e) => e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        feesDueC6 = classSixList
            .map((e) =>
                _getClassFee(StudentClass.values[e.studentClass]) -
                e.feesPaid.reduce((c, d) => c + d))
            .reduce((a, b) => a + b);
        balanceC6 = (feesPaidC6 - feesDueC6).abs();
      }

      final totalIncomeC6 = feesPaidC6 + registrationC6;
      stats.add(GeneralStatisticsDto(
          description: (sector == 0) ? 'CLASS 6' : 'CM2',
          roll: totalEnrollC6,
          feesDue: feesDueC6,
          registration: registrationC6,
          feesPaid: feesPaidC6,
          totalIncome: totalIncomeC6,
          balance: balanceC6));

      stats.add(GeneralStatisticsDto(
        description: 'TOTAL',
        roll: totalEnrollPn +
            totalEnrollN1 +
            totalEnrollN2 +
            totalEnrollC1 +
            totalEnrollC2 +
            totalEnrollC3 +
            totalEnrollC4 +
            totalEnrollC5 +
            totalEnrollC6,
        feesDue: feesDuePn +
            feesDueN1 +
            feesDueN2 +
            feesDueC1 +
            feesDueC2 +
            feesDueC3 +
            feesDueC4 +
            feesDueC5 +
            feesDueC6,
        registration: registrationPn +
            registrationN1 +
            registrationN2 +
            registrationC1 +
            registrationC2 +
            registrationC3 +
            registrationC4 +
            registrationC5 +
            registrationC6,
        feesPaid: feesPaidPn +
            feesPaidN1 +
            feesPaidN2 +
            feesPaidC1 +
            feesPaidC2 +
            feesPaidC3 +
            feesPaidC4 +
            feesPaidC5 +
            feesPaidC6,
        totalIncome: totalIncome +
            totalIncomeN1 +
            totalIncomeN2 +
            totalIncomeC1 +
            totalIncomeC2 +
            totalIncomeC3 +
            totalIncomeC4 +
            totalIncomeC5 +
            totalIncomeC6,
        balance: balancePn +
            balanceN1 +
            balanceN2 +
            balanceC1 +
            balanceC2 +
            balanceC3 +
            balanceC4 +
            balanceC5 +
            balanceC6,
      ));

      return stats;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<FeeCollectionStatisticsDto>> generateFeeCollectionStatistics(
      int sector, int sclass) async {
    try {
      final classList = await _studentRecord
          .filter()
          .academicYearEqualTo(SCHOOL_YEAR)
          .sectorEqualTo(sector)
          .studentClassEqualTo(sclass)
          .findAll();
      final int feeAmt = _getClassFee(StudentClass.values[sclass]);
      return classList.map((stud) {
        int totalPaid = stud.feesPaid.reduce((a, b) => a + b);
        return FeeCollectionStatisticsDto(
          name: stud.fullName,
          reg: (stud.paidRegistration) ? Fee.regFee : 0,
          feeAmt: feeAmt,
          feesPaid: stud.feesPaid,
          totalPaid: totalPaid,
          balance: feeAmt - totalPaid,
        );
      }).toList();
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
