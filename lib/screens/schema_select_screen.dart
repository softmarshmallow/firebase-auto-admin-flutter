// Select available schema as list and item

import 'package:firebase_auto_admin/models/schema.dart';
import 'package:firebase_auto_admin/utils/schema_reader.dart';
import 'package:flutter/material.dart';

class SchemaSelectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SchemaSelectScreen();
}

class _SchemaSelectScreen extends State<SchemaSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select schema to tour"),
      ),
      body: buildSchemaList(),
    );
  }

  Widget buildSchemaList() {
    return StreamBuilder<List<Schema>>(
        stream: getSchema(context).asStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return _buildSchemaListView(snapshot.data);
          }
        });
  }

  ListView _buildSchemaListView(items) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          Schema item = items[index];
          return new ListTile(
            title: Text(item.modelName),
            subtitle: Text(item.firestorePath),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right), onPressed: null),
          );
        });
  }
}
