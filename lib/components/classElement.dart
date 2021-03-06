
import 'package:cloud_firestore/cloud_firestore.dart';

class Produit {
  static int idClasse = 0;
  String prodTitle;
  int prodNombre;
  int prodQntStock;
  double prodPrix;
  double lastPrix;
  String prodImage;
  String categorie;
  final int idProduit = idClasse++;
  String prodDescription;
  String prodText;
  List<String> images = [];
  Produit({this.categorie, this.prodQntStock, this.prodImage, this.prodTitle, this.prodNombre, this.prodPrix, this.lastPrix, this.prodDescription, this.prodText, this.images});
}

class Blog {
  static int idPlog = 0;
  String blogTitle;
  String blogImage;
  int idBlog;
  String blogDescription;
  String blogMediaLink;
  String blogTime;
  List<String> images = [];
  Blog({this.blogTime, this.blogTitle, this.blogDescription, this.blogImage, this.blogMediaLink, this.idBlog, this.images});
}

class Person {
  String docId;
  String _idAuth;
  String _prenom ,_nom;
  String _adresse ,_ville, _region,_codePostale, _pays;
  String _telephone, _email;
  String _motDePasse;

  Map<String, dynamic> toMap() {
    return {
      '_idAuth' : this._idAuth,
      '_prenom' : this._prenom,
      '_nom' : this._nom,
      '_adresse' : this._adresse,
      '_ville' : this._ville,
      '_region' : this._region,
      '_codePostale' : this._codePostale,
      '_pays' : this._pays,
      '_telephone' : this._telephone,
      '_email' : this._email,

    };
  }

  Person(String docId, Map<String, dynamic> data) {
    this.docId = docId;
    this._idAuth = data['_idAuth'];
    this._prenom = data['_prenom'];
    this._nom = data['_nom'];
    this._adresse = data['_adresse'];
    this._ville = data['_ville'];
    this._region = data['_region'];
    this._codePostale = data['_codePostale'];
    this._pays = data['_pays'];
    this._telephone = data['_telephone'];
    this._email = data['_email'];
  }

  

  Future<DocumentReference> save() async {
    DocumentReference doc =
        await FirebaseFirestore.instance.collection('users').add(this.toMap());
    return doc;
  }

  String get getPrenom {
    return _prenom;
  }
  set setPrenom (String string) {
    _prenom = string;
  }
  String get getNom {
    return _nom;
  }
  set setNom (String string) {
    _nom = string;
  }

  String get getAdresse {
    return _adresse;
  }
  set setAdresse (String string) {
    _adresse = string;
  }

  String get getVille {
    return _ville;
  }
  set setVille(String string) {
    _ville = string;
  }
  String get getRegion {
    return _region;
  }
  set setRegion(String string) {
    _region = string;
  }

  String get getCodePos {
    return _codePostale;
  }
  set setCodePos(String string) {
    _codePostale = string;
  }

  String get getPays {
    return _pays;
  }
  set setPays(String string) {
    _pays = string;
  }

  String get getTele {
    return _telephone;
  }
  set setTele(String string) {
    _telephone = string;
  }

  String get getEmail {
    return _email;
  }
  set setEmail(String string) {
    _email = string;
  }

  String get getMotPass {
    return _motDePasse;
  }
  set setMotPass(String string) {
    _motDePasse = string;
  }

}

class Commande {
  String docId;
  String nomsProduits;
  String date;
  String nomC;
  String prenomC;
  String emailC;
  String teleC;
  String adresseC;
  String villeC;
  String regionC;
  String paysC;
  String codePostaleC;
  double prix;
  Commande(this.docId, this.adresseC, this.codePostaleC, this.date,this.emailC, this.nomC, this.nomsProduits,
  this.paysC, this.prenomC, this.prix, this.regionC, this.teleC, this.villeC);
}