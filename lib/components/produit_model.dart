import 'package:cloud_firestore/cloud_firestore.dart';

class ProduitModel {
  String docId;
  String titre;
  double prix;
  int qntStock;
  String imageUrl;
  String descirption;
  String text;
  int nbrDemande;
  String categorie;

  ProduitModel(String docId, Map<String, dynamic> data) {
    this.docId = docId;
    this.titre = data['titre'];
    this.prix = data['prix'];
    this.qntStock = data['qntStock'];
    this.imageUrl = data['imageUrl'];
    this.descirption = data['descirption'];
    this.text = data['text'];
    this.nbrDemande = data['nbrDemande'];
    this.categorie = data['categorie'];
  }

  Map<String, dynamic> toMap() {
    return {'titre' : this.titre,
    'prix' : this.prix,
    'qntStock' : this.qntStock,
    'imageUrl' : this.imageUrl,
    'descirption' : this.descirption,
    'text' : this.text,
    'nbrDemande' : this.nbrDemande,
    'categorie' : this.categorie,};
  }

  Future<DocumentReference> save() async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection('produits').add(this.toMap());
    return doc;
  }

  Future<void> delete() async {
    await FirebaseFirestore.instance.collection('produits').doc(this.docId).delete();
  }
  Future<void> update() async {
    await FirebaseFirestore.instance.collection('produits').doc(this.docId).update(this.toMap());
  }
}