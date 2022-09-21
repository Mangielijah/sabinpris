// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_record_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStudentRecordDtoCollection on Isar {
  IsarCollection<StudentRecordDto> get studentRecordDtos => this.collection();
}

const StudentRecordDtoSchema = CollectionSchema(
  name: r'StudentRecordDto',
  id: -1260452560662023730,
  properties: {
    r'academicYear': PropertySchema(
      id: 0,
      name: r'academicYear',
      type: IsarType.string,
    ),
    r'feesPaid': PropertySchema(
      id: 1,
      name: r'feesPaid',
      type: IsarType.longList,
    ),
    r'fullName': PropertySchema(
      id: 2,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 3,
      name: r'gender',
      type: IsarType.long,
    ),
    r'guardianContact': PropertySchema(
      id: 4,
      name: r'guardianContact',
      type: IsarType.string,
    ),
    r'guardianName': PropertySchema(
      id: 5,
      name: r'guardianName',
      type: IsarType.string,
    ),
    r'paidRegistration': PropertySchema(
      id: 6,
      name: r'paidRegistration',
      type: IsarType.bool,
    ),
    r'sector': PropertySchema(
      id: 7,
      name: r'sector',
      type: IsarType.long,
    ),
    r'studentClass': PropertySchema(
      id: 8,
      name: r'studentClass',
      type: IsarType.long,
    )
  },
  estimateSize: _studentRecordDtoEstimateSize,
  serialize: _studentRecordDtoSerialize,
  deserialize: _studentRecordDtoDeserialize,
  deserializeProp: _studentRecordDtoDeserializeProp,
  idName: r'recordId',
  indexes: {
    r'academicYear': IndexSchema(
      id: 5709124122912758715,
      name: r'academicYear',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'academicYear',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'fullName': IndexSchema(
      id: 8863244454116476334,
      name: r'fullName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fullName',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'sector_studentClass': IndexSchema(
      id: -6331236910127629402,
      name: r'sector_studentClass',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sector',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'studentClass',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'guardianName': IndexSchema(
      id: -4425164255952812496,
      name: r'guardianName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'guardianName',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _studentRecordDtoGetId,
  getLinks: _studentRecordDtoGetLinks,
  attach: _studentRecordDtoAttach,
  version: '3.0.0',
);

int _studentRecordDtoEstimateSize(
  StudentRecordDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.academicYear.length * 3;
  bytesCount += 3 + object.feesPaid.length * 8;
  bytesCount += 3 + object.fullName.length * 3;
  {
    final value = object.guardianContact;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.guardianName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _studentRecordDtoSerialize(
  StudentRecordDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.academicYear);
  writer.writeLongList(offsets[1], object.feesPaid);
  writer.writeString(offsets[2], object.fullName);
  writer.writeLong(offsets[3], object.gender);
  writer.writeString(offsets[4], object.guardianContact);
  writer.writeString(offsets[5], object.guardianName);
  writer.writeBool(offsets[6], object.paidRegistration);
  writer.writeLong(offsets[7], object.sector);
  writer.writeLong(offsets[8], object.studentClass);
}

StudentRecordDto _studentRecordDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudentRecordDto();
  object.academicYear = reader.readString(offsets[0]);
  object.feesPaid = reader.readLongList(offsets[1]) ?? [];
  object.fullName = reader.readString(offsets[2]);
  object.gender = reader.readLong(offsets[3]);
  object.guardianContact = reader.readStringOrNull(offsets[4]);
  object.guardianName = reader.readStringOrNull(offsets[5]);
  object.paidRegistration = reader.readBool(offsets[6]);
  object.recordId = id;
  object.sector = reader.readLong(offsets[7]);
  object.studentClass = reader.readLong(offsets[8]);
  return object;
}

P _studentRecordDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studentRecordDtoGetId(StudentRecordDto object) {
  return object.recordId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _studentRecordDtoGetLinks(StudentRecordDto object) {
  return [];
}

void _studentRecordDtoAttach(
    IsarCollection<dynamic> col, Id id, StudentRecordDto object) {
  object.recordId = id;
}

extension StudentRecordDtoQueryWhereSort
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QWhere> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhere> anyRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhere>
      anyAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'academicYear'),
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhere>
      anySectorStudentClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sector_studentClass'),
      );
    });
  }
}

extension StudentRecordDtoQueryWhere
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QWhereClause> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      recordIdEqualTo(Id recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: recordId,
        upper: recordId,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      recordIdNotEqualTo(Id recordId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: recordId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: recordId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: recordId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: recordId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      recordIdGreaterThan(Id recordId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: recordId, includeLower: include),
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      recordIdLessThan(Id recordId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: recordId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      recordIdBetween(
    Id lowerRecordId,
    Id upperRecordId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerRecordId,
        includeLower: includeLower,
        upper: upperRecordId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearEqualTo(String academicYear) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'academicYear',
        value: [academicYear],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearNotEqualTo(String academicYear) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'academicYear',
              lower: [],
              upper: [academicYear],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'academicYear',
              lower: [academicYear],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'academicYear',
              lower: [academicYear],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'academicYear',
              lower: [],
              upper: [academicYear],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearGreaterThan(
    String academicYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'academicYear',
        lower: [academicYear],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearLessThan(
    String academicYear, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'academicYear',
        lower: [],
        upper: [academicYear],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearBetween(
    String lowerAcademicYear,
    String upperAcademicYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'academicYear',
        lower: [lowerAcademicYear],
        includeLower: includeLower,
        upper: [upperAcademicYear],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearStartsWith(String AcademicYearPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'academicYear',
        lower: [AcademicYearPrefix],
        upper: ['$AcademicYearPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'academicYear',
        value: [''],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      academicYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'academicYear',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'academicYear',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'academicYear',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'academicYear',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      fullNameEqualTo(String fullName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fullName',
        value: [fullName],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      fullNameNotEqualTo(String fullName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [],
              upper: [fullName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [fullName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [fullName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [],
              upper: [fullName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorEqualToAnyStudentClass(int sector) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sector_studentClass',
        value: [sector],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorNotEqualToAnyStudentClass(int sector) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [],
              upper: [sector],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [],
              upper: [sector],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorGreaterThanAnyStudentClass(
    int sector, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [sector],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorLessThanAnyStudentClass(
    int sector, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [],
        upper: [sector],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorBetweenAnyStudentClass(
    int lowerSector,
    int upperSector, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [lowerSector],
        includeLower: includeLower,
        upper: [upperSector],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorStudentClassEqualTo(int sector, int studentClass) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sector_studentClass',
        value: [sector, studentClass],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorEqualToStudentClassNotEqualTo(int sector, int studentClass) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector],
              upper: [sector, studentClass],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector, studentClass],
              includeLower: false,
              upper: [sector],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector, studentClass],
              includeLower: false,
              upper: [sector],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sector_studentClass',
              lower: [sector],
              upper: [sector, studentClass],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorEqualToStudentClassGreaterThan(
    int sector,
    int studentClass, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [sector, studentClass],
        includeLower: include,
        upper: [sector],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorEqualToStudentClassLessThan(
    int sector,
    int studentClass, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [sector],
        upper: [sector, studentClass],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      sectorEqualToStudentClassBetween(
    int sector,
    int lowerStudentClass,
    int upperStudentClass, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sector_studentClass',
        lower: [sector, lowerStudentClass],
        includeLower: includeLower,
        upper: [sector, upperStudentClass],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      guardianNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'guardianName',
        value: [null],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      guardianNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'guardianName',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      guardianNameEqualTo(String? guardianName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'guardianName',
        value: [guardianName],
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterWhereClause>
      guardianNameNotEqualTo(String? guardianName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'guardianName',
              lower: [],
              upper: [guardianName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'guardianName',
              lower: [guardianName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'guardianName',
              lower: [guardianName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'guardianName',
              lower: [],
              upper: [guardianName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension StudentRecordDtoQueryFilter
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QFilterCondition> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'academicYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'academicYear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      academicYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feesPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feesPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feesPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feesPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      feesPaidLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feesPaid',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      genderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      genderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      genderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      genderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'guardianContact',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'guardianContact',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guardianContact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'guardianContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'guardianContact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guardianContact',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianContactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'guardianContact',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'guardianName',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'guardianName',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'guardianName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'guardianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'guardianName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'guardianName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      guardianNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'guardianName',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      paidRegistrationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidRegistration',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recordId',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recordId',
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      recordIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      sectorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      sectorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sector',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      sectorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sector',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      sectorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      studentClassEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentClass',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      studentClassGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentClass',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      studentClassLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentClass',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterFilterCondition>
      studentClassBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudentRecordDtoQueryObject
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QFilterCondition> {}

extension StudentRecordDtoQueryLinks
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QFilterCondition> {}

extension StudentRecordDtoQuerySortBy
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QSortBy> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGuardianContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianContact', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGuardianContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianContact', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGuardianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByGuardianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByPaidRegistration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidRegistration', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByPaidRegistrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidRegistration', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByStudentClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentClass', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      sortByStudentClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentClass', Sort.desc);
    });
  }
}

extension StudentRecordDtoQuerySortThenBy
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QSortThenBy> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGuardianContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianContact', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGuardianContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianContact', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGuardianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByGuardianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'guardianName', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByPaidRegistration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidRegistration', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByPaidRegistrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidRegistration', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByStudentClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentClass', Sort.asc);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QAfterSortBy>
      thenByStudentClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentClass', Sort.desc);
    });
  }
}

extension StudentRecordDtoQueryWhereDistinct
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct> {
  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByAcademicYear({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'academicYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByFeesPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feesPaid');
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByFullName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByGuardianContact({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guardianContact',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByGuardianName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'guardianName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByPaidRegistration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidRegistration');
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector');
    });
  }

  QueryBuilder<StudentRecordDto, StudentRecordDto, QDistinct>
      distinctByStudentClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentClass');
    });
  }
}

extension StudentRecordDtoQueryProperty
    on QueryBuilder<StudentRecordDto, StudentRecordDto, QQueryProperty> {
  QueryBuilder<StudentRecordDto, int, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<StudentRecordDto, String, QQueryOperations>
      academicYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'academicYear');
    });
  }

  QueryBuilder<StudentRecordDto, List<int>, QQueryOperations>
      feesPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feesPaid');
    });
  }

  QueryBuilder<StudentRecordDto, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<StudentRecordDto, int, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<StudentRecordDto, String?, QQueryOperations>
      guardianContactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guardianContact');
    });
  }

  QueryBuilder<StudentRecordDto, String?, QQueryOperations>
      guardianNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'guardianName');
    });
  }

  QueryBuilder<StudentRecordDto, bool, QQueryOperations>
      paidRegistrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidRegistration');
    });
  }

  QueryBuilder<StudentRecordDto, int, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<StudentRecordDto, int, QQueryOperations> studentClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentClass');
    });
  }
}
