import 'package:cloud_firestore/cloud_firestore.dart';

class CommandeModel {
  String docId;
  String fullName;
  String adresse;
  String email;
  String tele;
  double prix;
  String produitsId;

  CommandeModel(String docId, Map<String, dynamic> data) {
    this.docId = docId;
    this.fullName = data['fullName'];
    this.prix = data['prix'];
    this.adresse = data['adresse'];
    this.email = data['email'];
    this.tele = data['tele'];
    this.produitsId = data['produitsId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName' : this.fullName,
      'prix' : this.prix,
      'adresse' : this.adresse,
      'email' : this.email,
      'tele' : this.tele,
      'produitsId' : this.produitsId,

    };
  }

  Future<DocumentReference> save() async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection('commandes').add(this.toMap());
    return doc;
  }

  Future<void> delete() async {
    await FirebaseFirestore.instance.collection('commandes').doc(this.docId).delete();
  }
}