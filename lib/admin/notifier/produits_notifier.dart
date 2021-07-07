

import 'package:arijephyto/components/produit_model.dart';
import 'package:flutter/cupertino.dart';

class ProduitsNotifier with ChangeNotifier {
  List<ProduitModel> _produits = [];
  ProduitModel _currentProduit;

  List<ProduitModel> get produits => _produits;
  ProduitModel get currentProduit => _currentProduit;

  set produits(List<ProduitModel> list) {
    _produits = list;
    notifyListeners();
  }
  set currentProduit(ProduitModel todo) {
    _currentProduit = todo;
    notifyListeners();
  }
}