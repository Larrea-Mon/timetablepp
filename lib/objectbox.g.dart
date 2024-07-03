// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

import 'Models/holidayperiod.dart';
import 'Models/subject.dart';
import 'Models/termperiod.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 6712300024642865997),
      name: 'TermPeriod',
      lastPropertyId: const obx_int.IdUid(3, 7628532944252634798),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3735083573369474155),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6810973221594398258),
            name: 'start',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7628532944252634798),
            name: 'end',
            type: 10,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 3033383584820465524),
      name: 'HolidayPeriod',
      lastPropertyId: const obx_int.IdUid(4, 651313185732812970),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3314223274298000639),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1800696407142293280),
            name: 'start',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3066113653228354995),
            name: 'end',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 651313185732812970),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(7, 7039596356983433900),
      name: 'Subject',
      lastPropertyId: const obx_int.IdUid(7, 8244514203172194503),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 577877316626608401),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8193245059149668343),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4789907192747017289),
            name: 'abv',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1407323447579881166),
            name: 'teacher',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5604493318830112940),
            name: 'place',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8244514203172194503),
            name: 'color',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(7, 7039596356983433900),
      lastIndexId: const obx_int.IdUid(1, 1874221612835247666),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        3550581915661698429,
        5641477025173493033,
        7387174656048122430,
        2545113248978641425
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        4875495904651296124,
        2495712168504459199,
        6733068527520113198,
        8853223232895115220,
        8676671176066478731,
        4136888799807000002,
        5662718307907723849,
        6181656001915519347,
        1159009269193963203,
        4812326025030964172,
        7214797018055737408,
        2707582517948775339,
        4310842985319946914,
        3637776464582519531,
        1520117690305473185,
        6965828538278559551,
        6342334289272328411,
        258324090967465752,
        8555219835403082987
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    TermPeriod: obx_int.EntityDefinition<TermPeriod>(
        model: _entities[0],
        toOneRelations: (TermPeriod object) => [],
        toManyRelations: (TermPeriod object) => {},
        getId: (TermPeriod object) => object.id,
        setId: (TermPeriod object, int id) {
          object.id = id;
        },
        objectToFB: (TermPeriod object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.start?.millisecondsSinceEpoch);
          fbb.addInt64(2, object.end?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final startValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final endValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final startParam = startValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(startValue);
          final endParam = endValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(endValue);
          final object = TermPeriod(start: startParam, end: endParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    HolidayPeriod: obx_int.EntityDefinition<HolidayPeriod>(
        model: _entities[1],
        toOneRelations: (HolidayPeriod object) => [],
        toManyRelations: (HolidayPeriod object) => {},
        getId: (HolidayPeriod object) => object.id,
        setId: (HolidayPeriod object, int id) {
          object.id = id;
        },
        objectToFB: (HolidayPeriod object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.start?.millisecondsSinceEpoch);
          fbb.addInt64(2, object.end?.millisecondsSinceEpoch);
          fbb.addOffset(3, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final startValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final endValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final startParam = startValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(startValue);
          final endParam = endValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(endValue);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = HolidayPeriod(startParam, endParam, nameParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Subject: obx_int.EntityDefinition<Subject>(
        model: _entities[2],
        toOneRelations: (Subject object) => [],
        toManyRelations: (Subject object) => {},
        getId: (Subject object) => object.id,
        setId: (Subject object, int id) {
          object.id = id;
        },
        objectToFB: (Subject object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final abvOffset = fbb.writeString(object.abv);
          final teacherOffset = fbb.writeString(object.teacher);
          final placeOffset = fbb.writeString(object.place);
          final colorOffset = fbb.writeString(object.color);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, abvOffset);
          fbb.addOffset(3, teacherOffset);
          fbb.addOffset(4, placeOffset);
          fbb.addOffset(6, colorOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final abvParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final teacherParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final placeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final object = Subject(
              nameParam, abvParam, teacherParam, placeParam, colorParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [TermPeriod] entity fields to define ObjectBox queries.
class TermPeriod_ {
  /// See [TermPeriod.id].
  static final id =
      obx.QueryIntegerProperty<TermPeriod>(_entities[0].properties[0]);

  /// See [TermPeriod.start].
  static final start =
      obx.QueryDateProperty<TermPeriod>(_entities[0].properties[1]);

  /// See [TermPeriod.end].
  static final end =
      obx.QueryDateProperty<TermPeriod>(_entities[0].properties[2]);
}

/// [HolidayPeriod] entity fields to define ObjectBox queries.
class HolidayPeriod_ {
  /// See [HolidayPeriod.id].
  static final id =
      obx.QueryIntegerProperty<HolidayPeriod>(_entities[1].properties[0]);

  /// See [HolidayPeriod.start].
  static final start =
      obx.QueryDateProperty<HolidayPeriod>(_entities[1].properties[1]);

  /// See [HolidayPeriod.end].
  static final end =
      obx.QueryDateProperty<HolidayPeriod>(_entities[1].properties[2]);

  /// See [HolidayPeriod.name].
  static final name =
      obx.QueryStringProperty<HolidayPeriod>(_entities[1].properties[3]);
}

/// [Subject] entity fields to define ObjectBox queries.
class Subject_ {
  /// See [Subject.id].
  static final id =
      obx.QueryIntegerProperty<Subject>(_entities[2].properties[0]);

  /// See [Subject.name].
  static final name =
      obx.QueryStringProperty<Subject>(_entities[2].properties[1]);

  /// See [Subject.abv].
  static final abv =
      obx.QueryStringProperty<Subject>(_entities[2].properties[2]);

  /// See [Subject.teacher].
  static final teacher =
      obx.QueryStringProperty<Subject>(_entities[2].properties[3]);

  /// See [Subject.place].
  static final place =
      obx.QueryStringProperty<Subject>(_entities[2].properties[4]);

  /// See [Subject.color].
  static final color =
      obx.QueryStringProperty<Subject>(_entities[2].properties[5]);
}
