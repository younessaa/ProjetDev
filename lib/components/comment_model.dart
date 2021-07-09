import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String docId;
  String fullName;
  String comment;
  String date;

  CommentModel(String docId, Map<String, dynamic> data) {
    this.docId = docId;
    this.fullName = data['fullName'];
    this.comment = data['comment'];
    this.date = data['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName' : this.fullName,
      'comment' : this.comment,
      'date' : this.date

    };
  }

  Future<DocumentReference> save(String idP) async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection('produits/' + idP +'/comments').add(this.toMap());
    return doc;
  }

}