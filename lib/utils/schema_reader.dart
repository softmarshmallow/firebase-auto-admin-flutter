import 'dart:convert';
import 'dart:async';
import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/widgets.dart';

Future<List<Schema>> getSchema(BuildContext context) async {
  List<Schema> returnData = [];
  String jsonData =
      await DefaultAssetBundle.of(context).loadString("assets/schema.json");
  var parsedJson = json.decode(jsonData);
  List<dynamic> schemas = parsedJson["models"];
  schemas.forEach((f) => {returnData.add(Schema.fromJson(f))});
  return returnData;
}
