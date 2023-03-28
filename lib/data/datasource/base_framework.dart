// import 'dart:io';

// import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabinpris/credentials.dart';
import 'package:sabinpris/data/models/expenditure_dto.dart';
import 'package:sabinpris/data/models/student_record_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sabinpris/domain/entity/student_record.dart';

bool boxIsOpen = false;

@Singleton()
class BaseFramework {
  BaseFramework() {
    // _initIsar();
    _initHive();
  }

  // static BaseFramework? _instance;

  // static BaseFramework get instance =>
  //     _instance == null ? BaseFramework() : _instance!;

  // Isar? isar;

  List<StudentRecordDto> get studentRecord =>
      Hive.box<StudentRecordDto>(studentRecordBoxName).values.toList();
  // late IsarCollection<ExpenditureDto> expenditureRecord;
  Stream<List<StudentRecordDto>> get recordStream =>
      Hive.box<StudentRecordDto>(studentRecordBoxName).watchWithInitial();

  List<ExpenditureDto> get expenditureRecord =>
      Hive.box<ExpenditureDto>(expenditureBoxName).values.toList();

  // Future<void> _initIsar() async {
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String appDocPath = appDocDir.path;
  //   isar ??= await Isar.open(
  //     [StudentRecordDtoSchema, ExpenditureDtoSchema],
  //     directory: appDocPath,
  //     name: databaseName,
  //   );
  //   studentRecord = isar!.studentRecordDtos;
  //   expenditureRecord = isar!.expenditureDtos;
  //   recordStream = studentRecord
  //       .filter()
  //       .academicYearEqualTo(SCHOOL_YEAR)
  //       .watch(fireImmediately: true)
  //       .asBroadcastStream();
  // }

  Future<void> _initHive() async {
    if (!Hive.isBoxOpen(studentRecordBoxName)) {
      await Hive.openBox<StudentRecordDto>(
          studentRecordBoxName); // need to closed boxl

      // boxIsOpen = true;
    }

    if (!Hive.isBoxOpen(expenditureBoxName)) {
      await Hive.openBox<ExpenditureDto>(expenditureBoxName);
    }

    // recordStream =
    //     Hive.box<StudentRecordDto>(studentRecordBoxName).watchWithInitial().map((event) {
    //   List<StudentRecordDto> records = [event.value];
    //   return records;
    // });
  }
}

final String studentRecordBoxName = 'studentRecord-$SCHOOL_YEAR';
const String expenditureBoxName = 'expenditureDB';

extension BoxExtensions on Box {
  Stream<List<StudentRecordDto>> watchWithInitial({int? key}) async* {
    try {
      if (isOpen) {
        if (key == null) {
          yield* watch()
              .map(((event) => [event.value as StudentRecordDto]))
              .startWith(values.toList() as List<StudentRecordDto>)
              .asBroadcastStream();
        } else {
          yield* watch(key: key)
              .map(((event) => [event.value as StudentRecordDto]))
              .startWith([get(key) as StudentRecordDto]).asBroadcastStream();
        }
      } else {
        throw 'Box is not open on watch';
      }

      // Future.delayed(const Duration(milliseconds: 10), () async {
      //   if (key == null) {
      //     var obj = values.toList();
      //     for (int i = 0; i < values.length; i++) {
      //       final record = obj[i];
      //       await put(record.recordId, record);
      //     }
      //   } else {
      //     var obj = get(key);
      //     put(key, obj);
      //   }
      // });
    } on Exception {
      rethrow;
    }
  }
}

extension BoxExtensions2 on Box {
  Stream<List<ExpenditureDto>> watchExWithInitial({int? key}) async* {
    try {
      if (isOpen) {
        if (key == null) {
          yield* watch()
              .map(((event) => [event.value as ExpenditureDto]))
              .startWith(values.toList() as List<ExpenditureDto>)
              .asBroadcastStream();
        } else {
          yield* watch(key: key)
              .map(((event) => [event.value as ExpenditureDto]))
              .startWith([get(key) as ExpenditureDto]).asBroadcastStream();
        }
      } else {
        throw 'Box is not open on watch';
      }

      // Future.delayed(const Duration(milliseconds: 10), () async {
      //   if (key == null) {
      //     var obj = values.toList();
      //     for (int i = 0; i < values.length; i++) {
      //       final record = obj[i];
      //       await put(record.recordId, record);
      //     }
      //   } else {
      //     var obj = get(key);
      //     put(key, obj);
      //   }
      // });
    } on Exception {
      rethrow;
    }
  }
}
