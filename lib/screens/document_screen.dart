import 'package:firebase_auto_admin/widgets/field_item.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final String model;

  ScreenArguments(this.model);
}

class DocumentScreen extends StatefulWidget {
  static const routeName = '/document';
  @override
  State<StatefulWidget> createState() => _DocumentScreen();
}

class _DocumentScreen extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
      ),
      body: Column(
        children: <Widget>[
          FieldItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.check),
      ),
    );
  }
}
