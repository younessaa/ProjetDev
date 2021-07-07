import 'package:arijephyto/screens/panier/panier.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class CmiMethode extends StatefulWidget {
  @override
  _CmiMethodeState createState() => _CmiMethodeState();
}

class _CmiMethodeState extends State<CmiMethode> {
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
                  'Passer Commande Par CMI',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
            ),

            body: Center(
              child: ListView(
                children: [
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children : [
                          SizedBox(height: 5,),
                          Text(
                          'Methodes de paiement :',
                          style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorB, fontSize: kTextSize)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/cmi.jpg", height: 80,),
                          ),
                          SizedBox(height: 10,),
                          textAndField('Nom du porteur de carte'),
                          SizedBox(height: 5,),
                          textAndField('Numero de carte de paiement'),
                          SizedBox(height: 10,),
                          Text(
                          'Date d’expiration',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: kTextSize,
                            fontWeight: FontWeight.normal
                          ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                width: 100,
                                height : 40,
                                child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
                                        hintText: '01',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                  ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                width: 100,
                                height : 40,
                                child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
                                        hintText: '2024',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                  ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(
                              'Code de verification',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: kTextSize,
                                fontWeight: FontWeight.normal
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                width: 150,
                                height : 40,
                                child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                  ),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '(?)',
                                style: TextStyle(
                                  color : Color(0xFF4599FD)
                                ),
                                )
                            ],
                          ),
                          SizedBox(height: 20,)
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

  Column textAndField(String string) {
    return Column(
                            children: [
                              Text(
                              string,
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorB, fontSize: 18)),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
                                        hintText: string,
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                                  ),
                                ),
                              ),
                            ],
                          );
  }
  Text textCommande(String string, String string1) {
    return Text(
                            string + ' ' + (string1 == null ? ' ' : string1),
                            style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: kTextSizeTitle)),
                        );
  }
}
