import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_record.freezed.dart';

enum LanguageSector { english, french }

enum Gender { male, female }

enum StudentClass {
  preNusery,
  nuseryOne,
  nuseryTwo,
  classOne,
  classTwo,
  classThree,
  classFour,
  classFive,
  classSix,
}

@freezed
class StudentRecord with _$StudentRecord {
  const StudentRecord._();
  factory StudentRecord({
    required int recordId,
    required String academicYear,
    required String fullName,
    required Gender gender,
    required bool paidRegistration,
    required LanguageSector sector,
    required StudentClass studentClass,
    required String guardianName,
    required String guardianContact,
    required List<int> feesPaid,
  }) = _StudentRecord;
}

extension GenderExt on Gender {
  String get name => toString().split('.')[1];
}

extension LangExt on LanguageSector {
  String get name => toString().split('.')[1];
}

extension StdClassExt on StudentClass {
  String get name => toString().split('.')[1];
}
