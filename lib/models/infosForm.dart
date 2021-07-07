import 'package:arijephyto/models/forum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
class InfosForm extends StatefulWidget {
  @override
  _InfosFormState createState() => _InfosFormState();
}

class _InfosFormState extends State<InfosForm> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Text(
        'Saisie Votre Informations: ',
        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFFF0677C), fontSize: kTextSizeTitle)),
        ),
        SizedBox(
              height: 20,
            ),
            BlocForum('Prénom', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Nom', false,),
            SizedBox(
              height: 10,
            ),
            BlocForum('Adresse', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Ville', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Région', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Code poste', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Pays', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Téléphone', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Email', false,),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(  
                          checkColor: Colors.greenAccent,  
                          activeColor: Colors.blue,  
                          value: valuefirst,  
                          onChanged: (bool value) {  
                            setState(() {  
                              valuefirst = value;  
                            });  
                          },  
                ),
                Text(
                  'Créer un compte ?',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: kTextSize,
                  fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            Container(child: valuefirst == true ? BlocForum('Mot de passe', true) : null),
      ],
    );
  }
}

class InfosForm2 extends StatefulWidget {
  @override
  _InfosForm2State createState() => _InfosForm2State();
}

class _InfosForm2State extends State<InfosForm2> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
              height: 20,
            ),
            BlocForum('Prénom', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Nom', false,),
            SizedBox(
              height: 10,
            ),
            BlocForum('Adresse', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Ville', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Région', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Code poste', false),
            SizedBox(
              height: 10,
            ),
            BlocForum('Pays', false),
            SizedBox(
              height: 10,
            ),
      ],
    );
  }
}