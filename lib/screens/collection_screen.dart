import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/material.dart';

import 'document_screen.dart' as doc_screen;

class ScreenArguments {
  final Schema schema;

  ScreenArguments(this.schema);
}

class CollectionScreen extends StatefulWidget {
  static const routeName = '/collection';

  @override
  State<StatefulWidget> createState() => _CollectionScreen();
}

class _CollectionScreen extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.schema.modelName),
      ),
      body: buildDocumentList(args),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildDocumentList(ScreenArguments args) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          Firestore.instance.collection(args.schema.firestorePath).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      doc_screen.DocumentScreen.routeName,
                      arguments:
                          doc_screen.ScreenArguments(args.schema, document),
                    );
                  },
                  title: new Text(document['title']),
                  subtitle: new Text(document['rate'].toString()),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
