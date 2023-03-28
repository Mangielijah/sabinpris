import 'package:hive/hive.dart';
import 'package:sabinpris/domain/entity/student_record.dart';

part 'student_record_dto.g.dart';

@HiveType(typeId: 1)
class StudentRecordDto extends HiveObject {
  @HiveField(0)
  int? recordId;

  @HiveField(1)
  late String academicYear;

  @HiveField(2)
  late String fullName;

  @HiveField(3)
  late int gender;

  @HiveField(4)
  late bool paidRegistration;

  @HiveField(5)
  late int sector;

  @HiveField(6)
  late int studentClass;

  @HiveField(7)
  String? guardianName;

  @HiveField(8)
  String? guardianContact;

  @HiveField(9)
  late List<int> feesPaid;

  StudentRecord toDomain() {
    return StudentRecord(
      recordId: recordId,
      academicYear: academicYear,
      fullName: fullName,
      gender: Gender.values[gender],
      paidRegistration: paidRegistration,
      sector: LanguageSector.values[sector],
      studentClass: StudentClass.values[studentClass],
      guardianName: guardianName ?? '',
      guardianContact: guardianContact ?? '',
      feesPaid: feesPaid,
    );
  }

  static StudentRecordDto fromDomain(StudentRecord record) => StudentRecordDto()
    ..recordId = record.recordId
    ..academicYear = record.academicYear
    ..fullName = record.fullName
    ..gender = record.gender.index
    ..paidRegistration = record.paidRegistration
    ..sector = record.sector.index
    ..studentClass = record.studentClass.index
    ..guardianName = record.guardianName
    ..guardianContact = record.guardianContact
    ..feesPaid = record.feesPaid;

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'academicYear': academicYear,
      'fullName': fullName,
      'gender': gender,
      'paidRegistration': paidRegistration,
      'sector': sector,
      'studentClass': studentClass,
      'guardianName': guardianName,
      'guardianContact': guardianContact,
      'feesPaid': feesPaid,
    };
  }

  static StudentRecordDto fromJson(Map<String, dynamic> record) {
    return StudentRecordDto()
      ..recordId = record['recordId']!
      ..academicYear = record['academicYear']
      ..fullName = record['fullName']
      ..gender = record['gender']
      ..paidRegistration = record['paidRegistration']
      ..sector = record['sector']
      ..studentClass = record['studentClass']
      ..guardianName = record['guardianName']
      ..guardianContact = record['guardianContact']
      ..feesPaid =
          (record['feesPaid'] as List).map((fee) => fee as int).toList();
  }
}

/*
 import 'package:isar/isar.dart';
import 'package:sabinpris/domain/entity/student_record.dart';

part 'student_record_dto.g.dart';

@collection
class StudentRecordDto {
  Id? recordId = Isar.autoIncrement;
  @Index(type: IndexType.value)
  late String academicYear;
  @Index(caseSensitive: false)
  late String fullName;
  late int gender;
  late bool paidRegistration;
  @Index(composite: [CompositeIndex('studentClass')])
  late int sector;
  late int studentClass;
  @Index(caseSensitive: false)
  String? guardianName;
  String? guardianContact;
  late List<int> feesPaid;

  StudentRecord toDomain() {
    return StudentRecord(
      recordId: recordId,
      academicYear: academicYear,
      fullName: fullName,
      gender: Gender.values[gender],
      paidRegistration: paidRegistration,
      sector: LanguageSector.values[sector],
      studentClass: StudentClass.values[studentClass],
      guardianName: guardianName ?? '',
      guardianContact: guardianContact ?? '',
      feesPaid: feesPaid,
    );
  }

  static StudentRecordDto fromDomain(StudentRecord record) => StudentRecordDto()
    ..recordId = record.recordId
    ..academicYear = record.academicYear
    ..fullName = record.fullName
    ..gender = record.gender.index
    ..paidRegistration = record.paidRegistration
    ..sector = record.sector.index
    ..studentClass = record.studentClass.index
    ..guardianName = record.guardianName
    ..guardianContact = record.guardianContact
    ..feesPaid = record.feesPaid;
}
*/