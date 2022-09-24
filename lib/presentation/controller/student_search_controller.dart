import 'package:flutter/material.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/domain/entity/student_record.dart';
import 'package:sabinpris/domain/repositories/student_record_repository.dart';
import 'package:sabinpris/service_locator.dart';

class StudentSearch extends ChangeNotifier {
  StudentSearch() {
    _fullName = '';
    _sector = LanguageSector.english;
    _class = StudentClass.preNusery;
    _search();
  }
  late String _fullName;
  late LanguageSector _sector;
  late StudentClass _class;
  bool isLoading = false;

  List<StudentRecord> students = [];

  void search(String name, LanguageSector sector, StudentClass sclass) {
    _fullName = name;
    _sector = sector;
    _class = sclass;

    _search();
  }

  Future _search() async {
    isLoading = true;
    notifyListeners();
    final result =
        await serviceLocator<StudentRecordRepository>().searchStudent(
      year: SCHOOL_YEAR,
      fullName: _fullName,
      sector: _sector,
      studentClass: _class,
    );
    if (students != result) {
      students = [...result];
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
