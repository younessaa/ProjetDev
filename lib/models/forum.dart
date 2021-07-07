import 'dart:core';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlocForum extends StatefulWidget {
  String title;
  bool obsecur;
  BlocForum(String s, bool b) {
    title = s;
    obsecur = b;
  }

  @override
  _BlocForumState createState() => _BlocForumState();
}

class _BlocForumState extends State<BlocForum> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextField(
        onChanged: (value){
          switch (widget.title){
            case 'Prénom' : setState(() {
              MonCompte.person.setPrenom = value;
            });  break;
            case 'Nom' : setState(() {
              MonCompte.person.setPrenom = value;
            });  break;
            case 'Adresse' : setState(() {
              MonCompte.person.setNom = value;
            });  break;
            case 'Ville' : setState(() {
              MonCompte.person.setVille = value;
            });  break;
            case 'Région' : setState(() {
              MonCompte.person.setRegion = value;
            });  break;
            case 'Code poste' : setState(() {
              MonCompte.person.setPrenom = value;
            });  break;
            case 'Pays' : setState(() {
              MonCompte.person.setPays = value;
            });  break;
            case 'Téléphone' : setState(() {
              MonCompte.person.setTele = value;
            });  break;
            case 'Email' : setState(() {
              MonCompte.person.setEmail = value;
            });  break;
            case 'Mot de passe' : setState(() {
              MonCompte.person.setMotPass = value;
            });  break;
          }
        },
        obscureText: widget.obsecur,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
            hintText: widget.title,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
