import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auto_admin/models/schema.dart';
import 'package:firebase_auto_admin/widgets/field_item.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final Schema schema;
  final DocumentSnapshot document;

  ScreenArguments(this.schema, this.document);
}

class DocumentScreen extends StatefulWidget {
  static const routeName = '/document';
  @override
  State<StatefulWidget> createState() => _DocumentScreen();
}

class _DocumentScreen extends State<DocumentScreen> {
  Schema schema;
  DocumentSnapshot document;
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    schema = args.schema;
    document = args.document;
    return Scaffold(
      appBar: AppBar(
        title: Text("${args.schema.modelName}::${args.document.documentID}"),
      ),
      body: Column(
        children: <Widget>[
          Text("Document ID:: ${document.documentID}"),
          Expanded(
            child: buildFields(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }

  Widget buildFields() {
    return ListView.builder(
        itemBuilder: _buildProductItem, itemCount: schema.dataSchema.length);
  }

  Widget _buildProductItem(BuildContext context, int index) {
    DataSchemaItem dataSchemaItem = schema.dataSchema[index];
    String field = dataSchemaItem.field;
    dynamic content = document[field];
    return FieldItem(dataSchemaItem, content);
  }
}
