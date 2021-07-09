import 'package:arijephyto/components/produit_model.dart';
import 'package:flutter/material.dart';


ProduitModel getProduit(List<ProduitModel> list, String id){
  for (var i = 0; i < list.length; i++) {
    if(list[i].docId == id){
      return list[i];
    }
  }
  return null;
}

double calculeSommePanier(List<ProduitModel> list){
  double somme = 0;
  for (var i = 0; i < list.length; i++) {
    somme += list[i].prix * list[i].nbrDemande;
  }
  return somme;
}

bool infosValide(TextEditingController nom,
  TextEditingController prenom,TextEditingController adresse,
  TextEditingController ville,TextEditingController pays,
  TextEditingController region, TextEditingController tele,
  TextEditingController codePostale, TextEditingController email,
  TextEditingController motDePass) {
  if(prenom.text == null)
    return false;
  if(nom.text == null)
    return false;
  if(adresse.text == null)
    return false;
  if(ville.text == null)
    return false;
  if(pays.text == null)
    return false;
  if(region.text == null)
    return false;
  if(tele.text == null)
    return false;
  if(codePostale.text == null)
    return false;
  if(email.text == null)
    return false;
  if(motDePass.text == null)
    return false;
  return true;
}