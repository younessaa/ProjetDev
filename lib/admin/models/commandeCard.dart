import 'package:arijephyto/components/classElement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProduitCardAdm extends StatefulWidget {
  final Commande commande;
  ProduitCardAdm(this.commande);
  @override 
  _ProduitCardAdmState createState() => _ProduitCardAdmState();
}

class _ProduitCardAdmState extends State<ProduitCardAdm>{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Color(0xFFF5F5F5),
        child: InkWell(
          splashColor: Color(0xFFF5F5FF),
          onTap: () {
          },
          child: Container(
            width: width * 0.8,
            child: Padding( 
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  rowText(width, 'Nom : ', widget.commande.nomC),
                  rowText(width, 'Prenom : ', widget.commande.prenomC),
                  rowText(width, 'Adresse : ', widget.commande.adresseC),
                  rowText(width, 'Email : ', widget.commande.emailC),
                  rowText(width, 'Tele : ', widget.commande.teleC),
                  rowText(width, 'ville : ', widget.commande.villeC),
                  rowText(width, 'region : ', widget.commande.regionC),
                  rowText(width, 'Pays : ', widget.commande.paysC),
                  rowText(width, 'Code Postale : ', widget.commande.codePostaleC),
                  rowText(width, 'date : ', widget.commande.date.toString()),
                  rowText(width, 'Noms des Produits : ', widget.commande.nomsProduits),
                  rowText(width, 'Prix : ', widget.commande.nomC),
                  Container(
                    width: width * 0.6,
                    child: MaterialButton(
                          child: Center(
                            child: Text('Supprimer',
                                    style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                                  ),
                          ),
                          onPressed: () {
                            setState(() {
                              //listProduitsClass.remove(widget.produit);
                            });
                          },
                          color: Colors.redAccent,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
 }

Row rowText(double width, String string1, String string2) {
  return Row(
                  children: [
                    Container(
                      width: width * 0.3,
                      child: Text(
                        string1,
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                      ),
                    ),
                    Container(
                      width: width * 0.6,
                      child: Text(
                        string2,
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                      ),
                    ),
                  ],
                );
}
}