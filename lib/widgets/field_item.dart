import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/material.dart';

class FieldItem extends StatelessWidget {
  DataSchemaItem dataSchemaItem;
  var content;

  FieldItem(this.dataSchemaItem, this.content);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: content != null ? content.toString() : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: dataSchemaItem.field,
              ),
            )
          ],
        ),
      ),
    );
  }
}
