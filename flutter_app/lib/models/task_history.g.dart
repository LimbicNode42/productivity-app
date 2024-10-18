// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskHistoryCollection on Isar {
  IsarCollection<TaskHistory> get taskHistorys => this.collection();
}

const TaskHistorySchema = CollectionSchema(
  name: r'TaskHistory',
  id: -172266110336452280,
  properties: {
    r'dateRecorded': PropertySchema(
      id: 0,
      name: r'dateRecorded',
      type: IsarType.dateTime,
    ),
    r'finalValue': PropertySchema(
      id: 1,
      name: r'finalValue',
      type: IsarType.long,
    ),
    r'taskId': PropertySchema(
      id: 2,
      name: r'taskId',
      type: IsarType.long,
    )
  },
  estimateSize: _taskHistoryEstimateSize,
  serialize: _taskHistorySerialize,
  deserialize: _taskHistoryDeserialize,
  deserializeProp: _taskHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'taskId': IndexSchema(
      id: -6391211041487498726,
      name: r'taskId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'taskId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _taskHistoryGetId,
  getLinks: _taskHistoryGetLinks,
  attach: _taskHistoryAttach,
  version: '3.1.7',
);

int _taskHistoryEstimateSize(
  TaskHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _taskHistorySerialize(
  TaskHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateRecorded);
  writer.writeLong(offsets[1], object.finalValue);
  writer.writeLong(offsets[2], object.taskId);
}

TaskHistory _taskHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskHistory();
  object.dateRecorded = reader.readDateTime(offsets[0]);
  object.finalValue = reader.readLong(offsets[1]);
  object.id = id;
  object.taskId = reader.readLong(offsets[2]);
  return object;
}

P _taskHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskHistoryGetId(TaskHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskHistoryGetLinks(TaskHistory object) {
  return [];
}

void _taskHistoryAttach(
    IsarCollection<dynamic> col, Id id, TaskHistory object) {
  object.id = id;
}

extension TaskHistoryQueryWhereSort
    on QueryBuilder<TaskHistory, TaskHistory, QWhere> {
  QueryBuilder<TaskHistory, TaskHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhere> anyTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'taskId'),
      );
    });
  }
}

extension TaskHistoryQueryWhere
    on QueryBuilder<TaskHistory, TaskHistory, QWhereClause> {
  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> idBetween(
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

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> taskIdEqualTo(
      int taskId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'taskId',
        value: [taskId],
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> taskIdNotEqualTo(
      int taskId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [],
              upper: [taskId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [taskId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [taskId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [],
              upper: [taskId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> taskIdGreaterThan(
    int taskId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskId',
        lower: [taskId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> taskIdLessThan(
    int taskId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskId',
        lower: [],
        upper: [taskId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterWhereClause> taskIdBetween(
    int lowerTaskId,
    int upperTaskId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskId',
        lower: [lowerTaskId],
        includeLower: includeLower,
        upper: [upperTaskId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskHistoryQueryFilter
    on QueryBuilder<TaskHistory, TaskHistory, QFilterCondition> {
  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      dateRecordedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateRecorded',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      dateRecordedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateRecorded',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      dateRecordedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateRecorded',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      dateRecordedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateRecorded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      finalValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      finalValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      finalValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalValue',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      finalValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> taskIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition>
      taskIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> taskIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterFilterCondition> taskIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskHistoryQueryObject
    on QueryBuilder<TaskHistory, TaskHistory, QFilterCondition> {}

extension TaskHistoryQueryLinks
    on QueryBuilder<TaskHistory, TaskHistory, QFilterCondition> {}

extension TaskHistoryQuerySortBy
    on QueryBuilder<TaskHistory, TaskHistory, QSortBy> {
  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> sortByDateRecorded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecorded', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy>
      sortByDateRecordedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecorded', Sort.desc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> sortByFinalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalValue', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> sortByFinalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalValue', Sort.desc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> sortByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> sortByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }
}

extension TaskHistoryQuerySortThenBy
    on QueryBuilder<TaskHistory, TaskHistory, QSortThenBy> {
  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByDateRecorded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecorded', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy>
      thenByDateRecordedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecorded', Sort.desc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByFinalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalValue', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByFinalValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalValue', Sort.desc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QAfterSortBy> thenByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }
}

extension TaskHistoryQueryWhereDistinct
    on QueryBuilder<TaskHistory, TaskHistory, QDistinct> {
  QueryBuilder<TaskHistory, TaskHistory, QDistinct> distinctByDateRecorded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateRecorded');
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QDistinct> distinctByFinalValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalValue');
    });
  }

  QueryBuilder<TaskHistory, TaskHistory, QDistinct> distinctByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskId');
    });
  }
}

extension TaskHistoryQueryProperty
    on QueryBuilder<TaskHistory, TaskHistory, QQueryProperty> {
  QueryBuilder<TaskHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskHistory, DateTime, QQueryOperations> dateRecordedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateRecorded');
    });
  }

  QueryBuilder<TaskHistory, int, QQueryOperations> finalValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalValue');
    });
  }

  QueryBuilder<TaskHistory, int, QQueryOperations> taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskId');
    });
  }
}
