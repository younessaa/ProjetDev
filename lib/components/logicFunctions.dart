import 'package:arijephyto/components/produit_model.dart';

import 'classElement.dart';

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

bool infosValide(Person person) {
  if(person.getAdresse == '')
    return false;
  if(person.getCodePos == '')
    return false;
  if(person.getEmail == '')
    return false;
  if(person.getNom == '')
    return false;
  if(person.getRegion == '')
    return false;
  if(person.getPays == '')
    return false;
  if(person.getTele == '')
    return false;
  if(person.getPrenom == '')
    return false;
  if(person.getMotPass == '')
    return false;
  if(person.getVille == '')
    return false;
  return true;
}