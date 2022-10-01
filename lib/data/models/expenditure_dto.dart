import 'package:isar/isar.dart';
import 'package:sabinpris/domain/entity/expenditure.dart';

part 'expenditure_dto.g.dart';

@collection
class ExpenditureDto {
  Id? id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  late String academicYear;
  @Index(type: IndexType.value)
  late int expenseType;
  late int amount;
  late String? comment;
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
}
