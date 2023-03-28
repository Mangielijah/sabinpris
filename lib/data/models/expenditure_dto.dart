import 'package:isar/isar.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';
import 'package:hive/hive.dart';

part 'expenditure_dto.g.dart';

@HiveType(typeId: 100)
class ExpenditureDto {
  @HiveField(10)
  Id? id;

  @HiveField(11)
  late String academicYear;

  @HiveType(typeId: 12)
  late int expenseType;

  @HiveType(typeId: 13)
  late int amount;

  @HiveType(typeId: 14)
  late String? comment;

  @HiveType(typeId: 15)
  late int time;

  Expenditure toDomain() {
    return Expenditure(
      id: id,
      academicYear: academicYear,
      expenseType: ExpenditureType.values[expenseType],
      amount: amount,
      comment: comment ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(time),
    );
  }

  static ExpenditureDto fromDomain(Expenditure exp) => ExpenditureDto()
    ..id = exp.id
    ..academicYear = exp.academicYear
    ..expenseType = exp.expenseType.index
    ..amount = exp.amount
    ..comment = exp.comment
    ..time = exp.time.millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'academicYear': academicYear,
      'expenseType': expenseType,
      'amount': amount,
      'comment': comment,
      'time': time,
    };
  }

  static ExpenditureDto fromJson(Map<String, dynamic> record) {
    return ExpenditureDto()
      ..id = record['id']!
      ..academicYear = record['academicYear']
      ..expenseType = record['expenseType']
      ..amount = record['amount']
      ..comment = record['comment']
      ..time = record['time'];
  }
}


/*
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
 */