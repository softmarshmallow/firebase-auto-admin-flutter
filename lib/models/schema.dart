import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema {
  Schema();
  @JsonKey(name: 'model')
  String modelName;

  @JsonKey(name: 'firestore-path')
  String firestorePath;

  @JsonKey(name: 'data-schema')
  List<DataSchemaItem> dataSchema;

  @JsonKey(name: 'ui-schema')
  List<UiSchemaItem> uiSchema;

  factory Schema.fromJson(Map<String, dynamic> json) => _$SchemaFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}

@JsonSerializable()
class UiSchemaItem {
  UiSchemaItem();

  @JsonKey(name: 'field')
  String field;

  @JsonKey(name: 'meta')
  bool isMeta;

  @JsonKey(name: 'hidden')
  bool isHidden;

  @JsonKey(name: 'editable')
  bool isEditable;

  factory UiSchemaItem.fromJson(Map<String, dynamic> json) =>
      _$UiSchemaItemFromJson(json);
  Map<String, dynamic> toJson() => _$UiSchemaItemToJson(this);
}

@JsonSerializable()
class DataSchemaItem {
  DataSchemaItem();

  @JsonKey(name: 'field')
  String field;

  @JsonKey(name: 'data-type')
  String dataType;

  @JsonKey(name: 'world-type')
  String worldType;

  factory DataSchemaItem.fromJson(Map<String, dynamic> json) =>
      _$DataSchemaItemFromJson(json);
  Map<String, dynamic> toJson() => _$DataSchemaItemToJson(this);
}
