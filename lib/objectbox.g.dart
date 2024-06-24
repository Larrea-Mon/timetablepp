// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code
// ignore_for_file: camel_case_types, depend_on_referenced_packages,
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Models/event.dart';
import 'Models/holidayperiod.dart';
import 'Models/lesson.dart';
import 'Models/termperiod.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 2545113248978641425),
      name: 'Event',
      lastPropertyId: const obx_int.IdUid(6, 258324090967465752),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4310842985319946914),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3637776464582519531),
            name: 'name',
            type: 4,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1520117690305473185),
            name: 'notes',
            type: 4,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6965828538278559551),
            name: 'type',
            type: 4,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6342334289272328411),
            name: 'date',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 258324090967465752),
            name: 'percentage',
            type: 7,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
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
            type: 4,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(5, 7387174656048122430),
      name: 'Lesson',
      lastPropertyId: const obx_int.IdUid(4, 2707582517948775339),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1159009269193963203),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4812326025030964172),
            name: 'hour',
            type: 5,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7214797018055737408),
            name: 'minute',
            type: 5,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2707582517948775339),
            name: 'subjectId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 1874221612835247666),
            relationTarget: 'Subject')
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
      lastEntityId: const obx_int.IdUid(6, 5641477025173493033),
      lastIndexId: const obx_int.IdUid(1, 1874221612835247666),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [3550581915661698429, 5641477025173493033],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        4875495904651296124,
        2495712168504459199,
        6733068527520113198,
        8853223232895115220,
        8676671176066478731,
        4136888799807000002,
        5662718307907723849,
        6181656001915519347
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Event: obx_int.EntityDefinition<Event>(
        model: _entities[0],
        toOneRelations: (Event object) => [],
        toManyRelations: (Event object) => {},
        getId: (Event object) => object.id,
        setId: (Event object, int id) {
          object.id = id;
        },
        objectToFB: (Event object, fb.Builder fbb) {
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addUint16(1, object.name);
          fbb.addUint16(2, object.notes);
          fbb.addUint16(3, object.type);
          fbb.addInt64(4, object.date.millisecondsSinceEpoch);
          fbb.addFloat32(5, object.percentage);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam =
              const fb.Uint16Reader().vTableGet(buffer, rootOffset, 6, '');
          final dateParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final notesParam =
              const fb.Uint16Reader().vTableGet(buffer, rootOffset, 8, '');
          final percentageParam =
              const fb.Float32Reader().vTableGet(buffer, rootOffset, 14, 0);
          final typeParam =
              const fb.Uint16Reader().vTableGet(buffer, rootOffset, 10, '');
          final object = Event(
              nameParam, dateParam, notesParam, percentageParam, typeParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    TermPeriod: obx_int.EntityDefinition<TermPeriod>(
        model: _entities[1],
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
        model: _entities[2],
        toOneRelations: (HolidayPeriod object) => [],
        toManyRelations: (HolidayPeriod object) => {},
        getId: (HolidayPeriod object) => object.id,
        setId: (HolidayPeriod object, int id) {
          object.id = id;
        },
        objectToFB: (HolidayPeriod object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.start?.millisecondsSinceEpoch);
          fbb.addInt64(2, object.end?.millisecondsSinceEpoch);
          fbb.addUint16(3, object.name);
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
          final nameParam =
              const fb.Uint16Reader().vTableGet(buffer, rootOffset, 10, '');
          final object = HolidayPeriod(startParam, endParam, nameParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Lesson: obx_int.EntityDefinition<Lesson>(
        model: _entities[3],
        toOneRelations: (Lesson object) => [object.subject],
        toManyRelations: (Lesson object) => {},
        getId: (Lesson object) => object.id,
        setId: (Lesson object, int id) {
          object.id = id;
        },
        objectToFB: (Lesson object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt32(1, object.hour);
          fbb.addInt32(2, object.minute);
          fbb.addInt64(3, object.subject.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Lesson()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..hour = const fb.Int32Reader().vTableGet(buffer, rootOffset, 6, 0)
            ..minute =
                const fb.Int32Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.subject.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.subject.attach(store);
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Event] entity fields to define ObjectBox queries.
class Event_ {
  /// See [Event.id].
  static final id = obx.QueryIntegerProperty<Event>(_entities[0].properties[0]);

  /// See [Event.name].
  static final name =
      obx.QueryIntegerProperty<Event>(_entities[0].properties[1]);

  /// See [Event.notes].
  static final notes =
      obx.QueryIntegerProperty<Event>(_entities[0].properties[2]);

  /// See [Event.type].
  static final type =
      obx.QueryIntegerProperty<Event>(_entities[0].properties[3]);

  /// See [Event.date].
  static final date = obx.QueryDateProperty<Event>(_entities[0].properties[4]);

  /// See [Event.percentage].
  static final percentage =
      obx.QueryDoubleProperty<Event>(_entities[0].properties[5]);
}

/// [TermPeriod] entity fields to define ObjectBox queries.
class TermPeriod_ {
  /// See [TermPeriod.id].
  static final id =
      obx.QueryIntegerProperty<TermPeriod>(_entities[1].properties[0]);

  /// See [TermPeriod.start].
  static final start =
      obx.QueryDateProperty<TermPeriod>(_entities[1].properties[1]);

  /// See [TermPeriod.end].
  static final end =
      obx.QueryDateProperty<TermPeriod>(_entities[1].properties[2]);
}

/// [HolidayPeriod] entity fields to define ObjectBox queries.
class HolidayPeriod_ {
  /// See [HolidayPeriod.id].
  static final id =
      obx.QueryIntegerProperty<HolidayPeriod>(_entities[2].properties[0]);

  /// See [HolidayPeriod.start].
  static final start =
      obx.QueryDateProperty<HolidayPeriod>(_entities[2].properties[1]);

  /// See [HolidayPeriod.end].
  static final end =
      obx.QueryDateProperty<HolidayPeriod>(_entities[2].properties[2]);

  /// See [HolidayPeriod.name].
  static final name =
      obx.QueryIntegerProperty<HolidayPeriod>(_entities[2].properties[3]);
}

/// [Lesson] entity fields to define ObjectBox queries.
class Lesson_ {
  /// See [Lesson.id].
  static final id =
      obx.QueryIntegerProperty<Lesson>(_entities[3].properties[0]);

  /// See [Lesson.hour].
  static final hour =
      obx.QueryIntegerProperty<Lesson>(_entities[3].properties[1]);

  /// See [Lesson.minute].
  static final minute =
      obx.QueryIntegerProperty<Lesson>(_entities[3].properties[2]);

  /// See [Lesson.subject].
  static final subject =
      obx.QueryRelationToOne<Lesson, Subject>(_entities[3].properties[3]);
}
