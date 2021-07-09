

import 'package:arijephyto/components/produit_model.dart';
import 'package:arijephyto/models/produitCard.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{
  List<ProduitModel> listProduits;
  List<ProduitModel> recents = [];
  DataSearch(this.listProduits);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
    onPressed: (){
      query = "";
    }, 
    icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon : AnimatedIcons.menu_arrow,
        progress:transitionAnimation
      ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: todo
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProduitModel> suggList = query.isEmpty?recents:listProduits.where((p) => p.titre.startsWith(query)).toList();

    return new ListView.builder(
              itemCount: suggList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Padding(padding: EdgeInsets.only(bottom: 15), child : ProduitCard(suggList[index]));
              }
            );
  }

}