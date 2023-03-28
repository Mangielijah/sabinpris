// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_record_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentRecordDtoAdapter extends TypeAdapter<StudentRecordDto> {
  @override
  final int typeId = 1;

  @override
  StudentRecordDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentRecordDto()
      ..recordId = fields[0] as int?
      ..academicYear = fields[1] as String
      ..fullName = fields[2] as String
      ..gender = fields[3] as int
      ..paidRegistration = fields[4] as bool
      ..sector = fields[5] as int
      ..studentClass = fields[6] as int
      ..guardianName = fields[7] as String?
      ..guardianContact = fields[8] as String?
      ..feesPaid = (fields[9] as List).cast<int>();
  }

  @override
  void write(BinaryWriter writer, StudentRecordDto obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.recordId)
      ..writeByte(1)
      ..write(obj.academicYear)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.paidRegistration)
      ..writeByte(5)
      ..write(obj.sector)
      ..writeByte(6)
      ..write(obj.studentClass)
      ..writeByte(7)
      ..write(obj.guardianName)
      ..writeByte(8)
      ..write(obj.guardianContact)
      ..writeByte(9)
      ..write(obj.feesPaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentRecordDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
