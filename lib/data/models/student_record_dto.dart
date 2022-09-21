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
