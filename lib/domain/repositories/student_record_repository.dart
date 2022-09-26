import 'package:sabinpris/domain/entity/statistics.dart';
import 'package:sabinpris/domain/entity/student_record.dart';

abstract class StudentRecordRepository {
  Future<StudentRecord> registerStudent(StudentRecord record);
  Future<StudentRecord> updateFees(int recordId, int fees);
  Stream<int> totalNumberOfRegisteredStudent(String year);
  Stream<int> totalCollectedFees(String year);
  Stream<int> numStudentWithCompleteFees(String year);
  Stream<int> numStudentWithInCompleteFees(String year);
  Future<List<StudentRecord>> searchStudent({
    required String year,
    required String fullName,
    required LanguageSector sector,
    required StudentClass studentClass,
  });
  Future<List<GeneralStatistics>> getGeneralStatistics(String year);
  Future<List<GeneralStatistics>> getSectionSummaryStatistics(
      String year, LanguageSector sector);
  Future<List<FeeCollectionStatistics>> getFeeCollectionStatistics(
      LanguageSector sector, StudentClass sclass);
  Stream<StudentRecord> watchRecord(int recordId);
}
