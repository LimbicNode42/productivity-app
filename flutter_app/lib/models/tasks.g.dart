// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => this.collection();
}

const TaskSchema = CollectionSchema(
  name: r'Task',
  id: 2998003626758701373,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'goalId': PropertySchema(
      id: 1,
      name: r'goalId',
      type: IsarType.long,
    ),
    r'impact': PropertySchema(
      id: 2,
      name: r'impact',
      type: IsarType.long,
    ),
    r'lastReset': PropertySchema(
      id: 3,
      name: r'lastReset',
      type: IsarType.dateTime,
    ),
    r'maxResets': PropertySchema(
      id: 4,
      name: r'maxResets',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'period': PropertySchema(
      id: 6,
      name: r'period',
      type: IsarType.string,
    ),
    r'recurrenceInterval': PropertySchema(
      id: 7,
      name: r'recurrenceInterval',
      type: IsarType.long,
    ),
    r'recurrencePeriod': PropertySchema(
      id: 8,
      name: r'recurrencePeriod',
      type: IsarType.string,
    ),
    r'resetCount': PropertySchema(
      id: 9,
      name: r'resetCount',
      type: IsarType.long,
    ),
    r'resetDays': PropertySchema(
      id: 10,
      name: r'resetDays',
      type: IsarType.longList,
    ),
    r'taskTrackingEnabled': PropertySchema(
      id: 11,
      name: r'taskTrackingEnabled',
      type: IsarType.long,
    ),
    r'trackType': PropertySchema(
      id: 12,
      name: r'trackType',
      type: IsarType.string,
    ),
    r'trackedValue': PropertySchema(
      id: 13,
      name: r'trackedValue',
      type: IsarType.long,
    )
  },
  estimateSize: _taskEstimateSize,
  serialize: _taskSerialize,
  deserialize: _taskDeserialize,
  deserializeProp: _taskDeserializeProp,
  idName: r'id',
  indexes: {
    r'goalId': IndexSchema(
      id: 2738626632585230611,
      name: r'goalId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'goalId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _taskGetId,
  getLinks: _taskGetLinks,
  attach: _taskAttach,
  version: '3.1.7',
);

int _taskEstimateSize(
  Task object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.period.length * 3;
  bytesCount += 3 + object.recurrencePeriod.length * 3;
  bytesCount += 3 + object.resetDays.length * 8;
  bytesCount += 3 + object.trackType.length * 3;
  return bytesCount;
}

void _taskSerialize(
  Task object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeLong(offsets[1], object.goalId);
  writer.writeLong(offsets[2], object.impact);
  writer.writeDateTime(offsets[3], object.lastReset);
  writer.writeLong(offsets[4], object.maxResets);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.period);
  writer.writeLong(offsets[7], object.recurrenceInterval);
  writer.writeString(offsets[8], object.recurrencePeriod);
  writer.writeLong(offsets[9], object.resetCount);
  writer.writeLongList(offsets[10], object.resetDays);
  writer.writeLong(offsets[11], object.taskTrackingEnabled);
  writer.writeString(offsets[12], object.trackType);
  writer.writeLong(offsets[13], object.trackedValue);
}

Task _taskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Task();
  object.endDate = reader.readDateTimeOrNull(offsets[0]);
  object.goalId = reader.readLong(offsets[1]);
  object.id = id;
  object.impact = reader.readLong(offsets[2]);
  object.lastReset = reader.readDateTime(offsets[3]);
  object.maxResets = reader.readLongOrNull(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.period = reader.readString(offsets[6]);
  object.recurrenceInterval = reader.readLong(offsets[7]);
  object.recurrencePeriod = reader.readString(offsets[8]);
  object.resetCount = reader.readLong(offsets[9]);
  object.resetDays = reader.readLongList(offsets[10]) ?? [];
  object.taskTrackingEnabled = reader.readLong(offsets[11]);
  object.trackType = reader.readString(offsets[12]);
  object.trackedValue = reader.readLong(offsets[13]);
  return object;
}

P _taskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLongList(offset) ?? []) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskGetId(Task object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskGetLinks(Task object) {
  return [];
}

void _taskAttach(IsarCollection<dynamic> col, Id id, Task object) {
  object.id = id;
}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Task, Task, QAfterWhere> anyGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'goalId'),
      );
    });
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
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

  QueryBuilder<Task, Task, QAfterWhereClause> goalIdEqualTo(int goalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'goalId',
        value: [goalId],
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> goalIdNotEqualTo(int goalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'goalId',
              lower: [],
              upper: [goalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'goalId',
              lower: [goalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'goalId',
              lower: [goalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'goalId',
              lower: [],
              upper: [goalId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> goalIdGreaterThan(
    int goalId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'goalId',
        lower: [goalId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> goalIdLessThan(
    int goalId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'goalId',
        lower: [],
        upper: [goalId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> goalIdBetween(
    int lowerGoalId,
    int upperGoalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'goalId',
        lower: [lowerGoalId],
        includeLower: includeLower,
        upper: [upperGoalId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> endDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> goalIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> goalIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> goalIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goalId',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> goalIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Task, Task, QAfterFilterCondition> impactEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impact',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> impactGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impact',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> impactLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impact',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> impactBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastResetEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReset',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastResetGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReset',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastResetLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReset',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastResetBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxResets',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxResets',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxResets',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxResets',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxResets',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> maxResetsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxResets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'period',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'period',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> periodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrenceIntervalEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrenceIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrenceIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrenceInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrenceIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrenceInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurrencePeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurrencePeriod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurrencePeriod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurrencePeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> recurrencePeriodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurrencePeriod',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resetCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resetCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resetDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resetDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resetDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resetDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resetDaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resetDays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskTrackingEnabledEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTrackingEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition>
      taskTrackingEnabledGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskTrackingEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskTrackingEnabledLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskTrackingEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> taskTrackingEnabledBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskTrackingEnabled',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trackType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trackType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trackType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackType',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trackType',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackedValueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackedValue',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackedValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trackedValue',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackedValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trackedValue',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> trackedValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trackedValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskQueryObject on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQuerySortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByGoalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByImpact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impact', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByImpactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impact', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLastReset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReset', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLastResetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReset', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByMaxResets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxResets', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByMaxResetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxResets', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRecurrenceIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRecurrencePeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePeriod', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByRecurrencePeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePeriod', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByResetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resetCount', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByResetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resetCount', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTaskTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTrackingEnabled', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTaskTrackingEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTrackingEnabled', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTrackType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackType', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTrackTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackType', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTrackedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackedValue', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTrackedValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackedValue', Sort.desc);
    });
  }
}

extension TaskQuerySortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByGoalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goalId', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByImpact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impact', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByImpactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impact', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLastReset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReset', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLastResetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReset', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByMaxResets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxResets', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByMaxResetsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxResets', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRecurrenceIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrenceInterval', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRecurrencePeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePeriod', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByRecurrencePeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurrencePeriod', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByResetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resetCount', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByResetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resetCount', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTaskTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTrackingEnabled', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTaskTrackingEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTrackingEnabled', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTrackType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackType', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTrackTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackType', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTrackedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackedValue', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTrackedValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackedValue', Sort.desc);
    });
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByGoalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goalId');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByImpact() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impact');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByLastReset() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReset');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByMaxResets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxResets');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByPeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRecurrenceInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrenceInterval');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRecurrencePeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurrencePeriod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByResetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resetCount');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByResetDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resetDays');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTaskTrackingEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskTrackingEnabled');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTrackType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trackType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTrackedValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trackedValue');
    });
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Task, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> goalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goalId');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> impactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impact');
    });
  }

  QueryBuilder<Task, DateTime, QQueryOperations> lastResetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReset');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> maxResetsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxResets');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> recurrenceIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrenceInterval');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> recurrencePeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurrencePeriod');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> resetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resetCount');
    });
  }

  QueryBuilder<Task, List<int>, QQueryOperations> resetDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resetDays');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> taskTrackingEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskTrackingEnabled');
    });
  }

  QueryBuilder<Task, String, QQueryOperations> trackTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trackType');
    });
  }

  QueryBuilder<Task, int, QQueryOperations> trackedValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trackedValue');
    });
  }
}
