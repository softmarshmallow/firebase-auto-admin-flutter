// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  return Schema()
    ..modelName = json['model'] as String
    ..firestorePath = json['firestore-path'] as String
    ..dataSchema = (json['data-schema'] as List)
        ?.map((e) => e == null
            ? null
            : DataSchemaItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..uiSchema = (json['ui-schema'] as List)
        ?.map((e) =>
            e == null ? null : UiSchemaItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
      'model': instance.modelName,
      'firestore-path': instance.firestorePath,
      'data-schema': instance.dataSchema,
      'ui-schema': instance.uiSchema
    };

UiSchemaItem _$UiSchemaItemFromJson(Map<String, dynamic> json) {
  return UiSchemaItem()
    ..field = json['field'] as String
    ..isMeta = json['meta'] as bool
    ..isHidden = json['hidden'] as bool
    ..isEditable = json['editable'] as bool;
}

Map<String, dynamic> _$UiSchemaItemToJson(UiSchemaItem instance) =>
    <String, dynamic>{
      'field': instance.field,
      'meta': instance.isMeta,
      'hidden': instance.isHidden,
      'editable': instance.isEditable
    };

DataSchemaItem _$DataSchemaItemFromJson(Map<String, dynamic> json) {
  return DataSchemaItem()
    ..field = json['field'] as String
    ..dataType = json['data-type'] as String
    ..worldType = json['world-type'] as String;
}

Map<String, dynamic> _$DataSchemaItemToJson(DataSchemaItem instance) =>
    <String, dynamic>{
      'field': instance.field,
      'data-type': instance.dataType,
      'world-type': instance.worldType
    };
