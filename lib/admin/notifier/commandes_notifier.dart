import 'package:arijephyto/components/commande_model.dart';
import 'package:flutter/cupertino.dart';

class CommandesNotifier with ChangeNotifier {
  List<CommandeModel> _commandes = [];
  CommandeModel _currentCommande;

  List<CommandeModel> get commandes => _commandes;
  CommandeModel get currentCommande => _currentCommande;

  set commandes(List<CommandeModel> list) {
    _commandes = list;
    notifyListeners();
  }
  set currentCommande(CommandeModel todo) {
    _currentCommande = todo;
    notifyListeners();
  }
}