import 'dart:convert';
import 'dart:async';
import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/widgets.dart';

Future<List<Schema>> getSchema(BuildContext context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/schema.json");
  final parsed = json.decode(data.toString()).cast<Map<String, dynamic>>();
  final models = parsed["models"];
  return models.map<List<Schema>>((json) => new Schema.fromJson(json)).toList();
}
