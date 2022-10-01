// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenditure_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetExpenditureDtoCollection on Isar {
  IsarCollection<ExpenditureDto> get expenditureDtos => this.collection();
}

const ExpenditureDtoSchema = CollectionSchema(
  name: r'ExpenditureDto',
  id: -3612169269686798436,
  properties: {
    r'academicYear': PropertySchema(
      id: 0,
      name: r'academicYear',
      type: IsarType.string,
    ),
    r'amount': PropertySchema(
      id: 1,
      name: r'amount',
      type: IsarType.long,
    ),
    r'comment': PropertySchema(
      id: 2,
      name: r'comment',
      type: IsarType.string,
    ),
    r'expenseType': PropertySchema(
      id: 3,
      name: r'expenseType',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 4,
      name: r'time',
      type: IsarType.long,
    )
  },
  estimateSize: _expenditureDtoEstimateSize,
  serialize: _expenditureDtoSerialize,
  deserialize: _expenditureDtoDeserialize,
  deserializeProp: _expenditureDtoDeserializeProp,
  idName: r'id',
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
    r'expenseType': IndexSchema(
      id: 120733043534264604,
      name: r'expenseType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'expenseType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _expenditureDtoGetId,
  getLinks: _expenditureDtoGetLinks,
  attach: _expenditureDtoAttach,
  version: '3.0.0',
);

int _expenditureDtoEstimateSize(
  ExpenditureDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.academicYear.length * 3;
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _expenditureDtoSerialize(
  ExpenditureDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.academicYear);
  writer.writeLong(offsets[1], object.amount);
  writer.writeString(offsets[2], object.comment);
  writer.writeLong(offsets[3], object.expenseType);
  writer.writeLong(offsets[4], object.time);
}

ExpenditureDto _expenditureDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpenditureDto();
  object.academicYear = reader.readString(offsets[0]);
  object.amount = reader.readLong(offsets[1]);
  object.comment = reader.readStringOrNull(offsets[2]);
  object.expenseType = reader.readLong(offsets[3]);
  object.id = id;
  object.time = reader.readLong(offsets[4]);
  return object;
}

P _expenditureDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expenditureDtoGetId(ExpenditureDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _expenditureDtoGetLinks(ExpenditureDto object) {
  return [];
}

void _expenditureDtoAttach(
    IsarCollection<dynamic> col, Id id, ExpenditureDto object) {
  object.id = id;
}

extension ExpenditureDtoQueryWhereSort
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QWhere> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhere> anyAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'academicYear'),
      );
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhere> anyExpenseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'expenseType'),
      );
    });
  }
}

extension ExpenditureDtoQueryWhere
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QWhereClause> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      academicYearEqualTo(String academicYear) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'academicYear',
        value: [academicYear],
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      academicYearStartsWith(String AcademicYearPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'academicYear',
        lower: [AcademicYearPrefix],
        upper: ['$AcademicYearPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      academicYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'academicYear',
        value: [''],
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      expenseTypeEqualTo(int expenseType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'expenseType',
        value: [expenseType],
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      expenseTypeNotEqualTo(int expenseType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseType',
              lower: [],
              upper: [expenseType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseType',
              lower: [expenseType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseType',
              lower: [expenseType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'expenseType',
              lower: [],
              upper: [expenseType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      expenseTypeGreaterThan(
    int expenseType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expenseType',
        lower: [expenseType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      expenseTypeLessThan(
    int expenseType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expenseType',
        lower: [],
        upper: [expenseType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterWhereClause>
      expenseTypeBetween(
    int lowerExpenseType,
    int upperExpenseType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'expenseType',
        lower: [lowerExpenseType],
        includeLower: includeLower,
        upper: [upperExpenseType],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpenditureDtoQueryFilter
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QFilterCondition> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
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

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      academicYearContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'academicYear',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      academicYearMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'academicYear',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      academicYearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      academicYearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'academicYear',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      amountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      amountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      amountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      amountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      expenseTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseType',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      expenseTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseType',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      expenseTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseType',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      expenseTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      timeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      timeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      timeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterFilterCondition>
      timeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpenditureDtoQueryObject
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QFilterCondition> {}

extension ExpenditureDtoQueryLinks
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QFilterCondition> {}

extension ExpenditureDtoQuerySortBy
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QSortBy> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByExpenseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseType', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      sortByExpenseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseType', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension ExpenditureDtoQuerySortThenBy
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QSortThenBy> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByAcademicYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByAcademicYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'academicYear', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByExpenseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseType', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy>
      thenByExpenseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseType', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension ExpenditureDtoQueryWhereDistinct
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct> {
  QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct>
      distinctByAcademicYear({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'academicYear', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct>
      distinctByExpenseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseType');
    });
  }

  QueryBuilder<ExpenditureDto, ExpenditureDto, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }
}

extension ExpenditureDtoQueryProperty
    on QueryBuilder<ExpenditureDto, ExpenditureDto, QQueryProperty> {
  QueryBuilder<ExpenditureDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExpenditureDto, String, QQueryOperations>
      academicYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'academicYear');
    });
  }

  QueryBuilder<ExpenditureDto, int, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ExpenditureDto, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<ExpenditureDto, int, QQueryOperations> expenseTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseType');
    });
  }

  QueryBuilder<ExpenditureDto, int, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}
