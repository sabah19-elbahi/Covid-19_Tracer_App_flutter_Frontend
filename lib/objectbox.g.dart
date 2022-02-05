// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/qr_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6347428599388032274),
      name: 'QrCodeModel',
      lastPropertyId: const IdUid(5, 1676753942007821186),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8744638334158776572),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5020729154597620483),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1854372084843290707),
            name: 'type',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2271543407938483338),
            name: 'pcr',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1676753942007821186),
            name: 'date',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 851750753509131722),
      name: 'ContactModel',
      lastPropertyId: const IdUid(5, 4163263891535024578),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5758357858892734636),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8352128688561937044),
            name: 'fcm_token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2334891373895362661),
            name: 'udid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1901433401135297113),
            name: 'date',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4163263891535024578),
            name: 'notPersisted',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 851750753509131722),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    QrCodeModel: EntityDefinition<QrCodeModel>(
        model: _entities[0],
        toOneRelations: (QrCodeModel object) => [],
        toManyRelations: (QrCodeModel object) => {},
        getId: (QrCodeModel object) => object.id,
        setId: (QrCodeModel object, int id) {
          object.id = id;
        },
        objectToFB: (QrCodeModel object, fb.Builder fbb) {
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, contentOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addBool(3, object.pcr);
          fbb.addInt64(4, object.date.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = QrCodeModel(
              content: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              pcr: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              date: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0)),
              type: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        }),
    ContactModel: EntityDefinition<ContactModel>(
        model: _entities[1],
        toOneRelations: (ContactModel object) => [],
        toManyRelations: (ContactModel object) => {},
        getId: (ContactModel object) => object.id,
        setId: (ContactModel object, int id) {
          object.id = id;
        },
        objectToFB: (ContactModel object, fb.Builder fbb) {
          final fcm_tokenOffset = object.fcm_token == null
              ? null
              : fbb.writeString(object.fcm_token!);
          final udidOffset =
              object.udid == null ? null : fbb.writeString(object.udid!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fcm_tokenOffset);
          fbb.addOffset(2, udidOffset);
          fbb.addInt64(3, object.date?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.notPersisted);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final object = ContactModel(
              date: dateValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(dateValue),
              udid: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              fcm_token: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0))
            ..notPersisted = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 12);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [QrCodeModel] entity fields to define ObjectBox queries.
class QrCodeModel_ {
  /// see [QrCodeModel.id]
  static final id =
      QueryIntegerProperty<QrCodeModel>(_entities[0].properties[0]);

  /// see [QrCodeModel.content]
  static final content =
      QueryStringProperty<QrCodeModel>(_entities[0].properties[1]);

  /// see [QrCodeModel.type]
  static final type =
      QueryStringProperty<QrCodeModel>(_entities[0].properties[2]);

  /// see [QrCodeModel.pcr]
  static final pcr =
      QueryBooleanProperty<QrCodeModel>(_entities[0].properties[3]);

  /// see [QrCodeModel.date]
  static final date =
      QueryIntegerProperty<QrCodeModel>(_entities[0].properties[4]);
}

/// [ContactModel] entity fields to define ObjectBox queries.
class ContactModel_ {
  /// see [ContactModel.id]
  static final id =
      QueryIntegerProperty<ContactModel>(_entities[1].properties[0]);

  /// see [ContactModel.fcm_token]
  static final fcm_token =
      QueryStringProperty<ContactModel>(_entities[1].properties[1]);

  /// see [ContactModel.udid]
  static final udid =
      QueryStringProperty<ContactModel>(_entities[1].properties[2]);

  /// see [ContactModel.date]
  static final date =
      QueryIntegerProperty<ContactModel>(_entities[1].properties[3]);

  /// see [ContactModel.notPersisted]
  static final notPersisted =
      QueryIntegerProperty<ContactModel>(_entities[1].properties[4]);
}
