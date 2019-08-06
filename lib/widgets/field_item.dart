import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/material.dart';

class FieldItem extends StatelessWidget {
  DataSchemaItem dataSchemaItem;
  var content;

  FieldItem(this.dataSchemaItem, this.content);
  @override
  Widget build(BuildContext context) {
    Widget child;

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: getChildTypeDisplay(context),
      ),
    );
  }

  Widget getChildTypeDisplay(BuildContext context) {
    switch (dataSchemaItem.dataType) {
      case 'string':
        return buildTextField();
      case 'number':
        return buildNumberField();
      case 'timestamp':
        return buildDateTimeField(context);
      default:
        return Text(
          "No matching type for '${dataSchemaItem.dataType}'. this type is not supported yet",
          style: TextStyle(color: Colors.grey),
        );
    }
  }

  Widget buildTextField() {
    return TextFormField(
      initialValue: content != null ? content.toString() : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: dataSchemaItem.field,
      ),
    );
  }

  Widget buildNumberField() {
    return TextFormField(
      initialValue: content != null ? content.toString() : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: dataSchemaItem.field,
      ),
      keyboardType: TextInputType.number,
    );
  }

  // todo
  Widget buildDateTimeField(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime(2199));
      },
      child: Text("Edit date:: 2019.6.7 24:23:00"),
    );
  }
}
