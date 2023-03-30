// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenditureDtoAdapter extends TypeAdapter<ExpenditureDto> {
  @override
  final int typeId = 100;

  @override
  ExpenditureDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenditureDto()
      ..id = fields[10] as int?
      ..academicYear = fields[11] as String
      ..expenseType = fields[12] as int
      ..amount = fields[13] as int
      ..comment = fields[14] as String?
      ..time = fields[15] as int;
  }

  @override
  void write(BinaryWriter writer, ExpenditureDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.academicYear)
      ..writeByte(12)
      ..write(obj.expenseType)
      ..writeByte(13)
      ..write(obj.amount)
      ..writeByte(14)
      ..write(obj.comment)
      ..writeByte(15)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenditureDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
