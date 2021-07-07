import 'package:arijephyto/models/infosForm.dart';
import 'package:arijephyto/screens/panier/panier.dart';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class PasserCommande extends StatefulWidget {
  @override
  _PasserCommandeState createState() => _PasserCommandeState();
}

class _PasserCommandeState extends State<PasserCommande> {

  bool cmi = true, valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    )
                  ),
                  title: Text(
                  'Passer Commande',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
            ),

            body: Center(
              child: ListView(
                children: [
                  Container(
                    child: MonCompte.isConnected == false ? InfosForm() : Column(
                      children: [
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
                            'Expédier à une adresse différente ?',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: kTextSize,
                            fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                ),

                        Container(
                          child : valuefirst == true ? InfosForm2() : null
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              mainAxisAlignment : MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                      'Informations du client : ',
                                      style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFFF0677C), fontSize: kTextSizeTitle)),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                textCommande('Prénom : ', ' ' ), //MonCompte.person.getPrenom),
                                textCommande('Nom : ', ' '), //MonCompte.person.getNom),
                                textCommande('Adresse : ', ' '), //MonCompte.person.getAdresse),
                                textCommande('Email : ' , ' '),//MonCompte.person.getEmail),
                                textCommande('Telephone : ' , ' ')//MonCompte.person.getTele),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children : [
                          Center(
                            child: Text(
                            'Methode de Paiment',
                            style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFFF0677C), fontSize: kTextSizeTitle)),
                            ),
                          ),
                          SizedBox(height : 10),
                          methodePaiement('CMI', cmi,),
                          SizedBox(height : 10),
                          methodePaiement('Paiment à la livraison', !cmi),
                          SizedBox(height : 10),
                        ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children : [
                          SizedBox(height : 10),
                          Text(
                              'Détail de commande',
                              style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFFF0677C), fontSize: kTextSizeTitle)),
                          ),
                          SizedBox(height : 10),
                          textCommande('Identifiant :','102'),
                          textCommande('Montant : ' , Panier.somme.toString() + '0 DH'),
                          textCommande('Nom du marchande :', 'ARIJPHYTO'),
                          SizedBox(height : 10), 
                          
                        ]
                      ),
                    ),
                  ),
                  Row(
                  mainAxisAlignment : MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: TextButton(
                        autofocus: true,
                        style: TextButton.styleFrom(
                          backgroundColor : Color(0xFF6C8DAB),
                          enableFeedback: false,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Annuler',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextSize,
                            fontWeight: FontWeight.bold
                          ),
                        ) 
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor : Color(0xFF6C8DAB),
                          enableFeedback: false,
                        ),
                        onPressed: (){
                          if(cmi == true)
                            Navigator.pushNamed(context, '/cmiMethode');
                          else{
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Votre demande est bien enregistrée'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(context, '/home'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Valider',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextSize,
                            fontWeight: FontWeight.bold
                          ),
                        ) 
                      ),
                    )
                  ],
                )
                ],
              ),
            )
    )
    ,
  );
  }

  Text textCommande(String string, String string1) {
    return Text(
                            string + ' ' + (string1 == null ? ' ' : string1),
                            style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: kTextSizeTitle)),
                        );
  }

  GestureDetector methodePaiement(String string, bool b) {
    return GestureDetector(
                        onTap: () {
                          setState(() {
                            cmi = !cmi;
                          });
                        },
                        child: Row(
                          children : [
                            SizedBox(width: 45,),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: b == true ? Color(0xFF5AFD32) : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('  '),
                            ),
                            SizedBox(width: 15,),
                            Text(
                              string,
                              style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: kTextSize)),
                            ),
                          ]
                        ),
                      );
  }
}