import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionRepository {
  void A() {
    Firestore.instance
        .collection('books')
        .document()
        .setData({'title': 'title', 'author': 'author'});
  }
}
