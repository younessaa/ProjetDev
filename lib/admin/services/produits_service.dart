
import 'package:arijephyto/admin/notifier/produits_notifier.dart';
import 'package:arijephyto/components/produit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getProduits(ProduitsNotifier produitsNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('produits').get();
  List<ProduitModel> produits = [];
  snapshot.docs.forEach((doc) {
    print(doc.data());
    ProduitModel produit = new ProduitModel(doc.id,doc.data());
    produits.add(produit);
  });
  produitsNotifier.produits = produits;
}

addProduit(ProduitsNotifier produitNotifier, String titre,
  double prix, int qntStock, String imageUrl,
   String descirption, String text, int nbrDemande, String categorie,) async {
  ProduitModel produitModel = ProduitModel("", {
    'titre' : titre,
    'prix' : prix,
    'qntStock' : qntStock,
    'imageUrl' : imageUrl,
    'descirption' : descirption,
    'text' : text,
    'nbrDemande' : nbrDemande,
    'categorie' : categorie,
  });
  DocumentReference doc = await produitModel.save();
  produitModel.docId = doc.id;
  List produits = produitNotifier.produits;
  produits.add(produitModel);
  produitNotifier.produits = produits;
}

deleteProduit(ProduitsNotifier produitNotifier,ProduitModel produitModel) async {
  List<ProduitModel> produits = produitNotifier.produits;
  await produitModel.delete();
  produits.removeWhere((currTodo) => currTodo.docId.compareTo(produitModel.docId) == 0);
  produitNotifier.produits = produits;
}

updateProduits(ProduitsNotifier produitNotifier, String titre,
  double prix, int qntStock, String imageUrl,
   String descirption, String text, int nbrDemande, String categorie,) async {
  List<ProduitModel> produits = produitNotifier.produits;
  ProduitModel produitModel = produitNotifier.currentProduit;
  produitModel.titre = titre;
  produitModel.prix = prix;
  produitModel.qntStock = qntStock;
  produitModel.imageUrl = imageUrl;
  produitModel.descirption = descirption;
  produitModel.text = text;
  produitModel.nbrDemande = nbrDemande;
  produitModel.categorie = categorie;

  produits.removeWhere((currPro) => currPro.docId.compareTo(produitModel.docId) == 0);
  produits.add(produitModel);
  await produitModel.update();
  produitNotifier.produits = produits;
}