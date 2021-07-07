import 'package:arijephyto/components/logicFunctions.dart';
import 'package:arijephyto/components/produit_model.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/models/produitCardPanier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../nav-draw.dart';


class Panier extends StatefulWidget{
  static List<ProduitModel> listProduitsPanier = [];
  static double somme = calculeSommePanier(listProduitsPanier);
  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBarMeth(height, width, 'Panier'),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children : [
                Container(
                  height: height * 0.6,
                  child: new ListView.builder(
                  itemCount: Panier.listProduitsPanier.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(padding: EdgeInsets.only(bottom: 10, top: 5), child : ProduitCardPanier(Panier.listProduitsPanier[index]));
                  }
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top : 14.0),
                          child: Text(
                            'Total panier',
                            style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.black, 
                                    fontSize: kTextSizeTitle
                                )
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left : 14.0),
                            child: Text(
                            'Total',
                            style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.black, 
                                    fontSize: kTextSizeTitle
                                )
                            ),
                        ),
                          ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right : 14.0),
                          child: Text(
                            Panier.somme.toString() + '0 Dh',
                            style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.black, 
                                    fontSize: kTextSizeTitle
                                )
                            ),
                          ),
                        ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom : 4.0),
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextButton(
                                child: Text(' Passer commande ',
                                        style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25)),
                                      ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/passercommande'); //passercommande
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFFEA5252), enableFeedback: false,),
                              ),    
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavyBarMeth(3),
    )
    ,
  );
  }
}