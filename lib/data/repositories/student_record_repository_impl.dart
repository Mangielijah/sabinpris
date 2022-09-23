import 'package:injectable/injectable.dart';
import 'package:sabinpris/data/datasource/std_record_datasource.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';

@LazySingleton(as: StudentRecordRepository)
class StudentRecordRepositoryImpl extends StudentRecordRepository {
  StudentRecordDataSource dataSource;
  StudentRecordRepositoryImpl(this.dataSource);
  @override
  Future<StudentRecord> registerStudent(StudentRecord record) async {
    try {
      final student = StudentRecordDto.fromDomain(record);
      final registeredStudent = await dataSource.registerStudent(student);
      return registeredStudent.toDomain();
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Future<StudentRecord> updateFees(int recordId, int fees) async {
    try {
      final student = await dataSource.updateFees(recordId, fees);
      return student.toDomain();
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Stream<int> totalCollectedFees(String year) async* {
    try {
      final fees = dataSource.totalCollectedFees(year);
      yield* fees;
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }

  @override
  Stream<int> totalNumberOfRegisteredStudent(String year) async* {
    try {
      final regStudents = dataSource.totalNumberOfStudents(year);
      yield* regStudents;
    } catch (e) {
      throw Exception('Could Not Register Student');
    }
  }
}
