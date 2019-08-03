import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auto_admin/models/schema.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final String model;

  ScreenArguments(this.model);
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
        title: Text(args.model),
      ),
      body: DocumentList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class DocumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movies').snapshots(),
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
