import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';

Future<String> json_raw(BuildContext context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");
  final jsonResult = json.decode(data);
  return jsonResult;
}
