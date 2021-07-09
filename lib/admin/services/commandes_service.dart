import 'package:arijephyto/admin/notifier/commandes_notifier.dart';
import 'package:arijephyto/components/commande_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getCommandes(CommandesNotifier commandesNotifier) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('commandes').get();
  List<CommandeModel> commandes = [];
  snapshot.docs.forEach((doc) {
    CommandeModel commande = new CommandeModel(doc.id,doc.data());
    commandes.add(commande);
  });
  commandesNotifier.commandes = commandes;
}

addCommande(CommandesNotifier commandeNotifier, 
  String fullName, String adresse,  String email, String tele,
  double prix ,String produitsId) async {
  CommandeModel commandeModel = CommandeModel("", {
    'fullName' : fullName,
    'prix' : prix,
    'adresse' : adresse,
    'email' : email,
    'tele' : tele,
    'produitsId' : produitsId,
  });
  DocumentReference doc = await commandeModel.save();
  commandeModel.docId = doc.id;
  List commandes = commandeNotifier.commandes;
  commandes.add(commandeModel);
  commandeNotifier.commandes = commandes;
}

deleteCommande(CommandesNotifier commandeNotifier,CommandeModel commandeModel) async {
  List<CommandeModel> produits = commandeNotifier.commandes;
  await commandeModel.delete();
  produits.removeWhere((currTodo) => currTodo.docId.compareTo(commandeModel.docId) == 0);
  commandeNotifier.commandes = produits;
}
