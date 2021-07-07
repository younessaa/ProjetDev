import 'package:arijephyto/components/logicFunctions.dart';
import 'package:arijephyto/components/produit_model.dart';
import 'package:arijephyto/screens/panier/panier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class ProduitCardPanier extends StatefulWidget {
  final ProduitModel produit;
  ProduitCardPanier(this.produit);
  @override 
  _ProduitCardPanierState createState() => _ProduitCardPanierState();
}

class _ProduitCardPanierState extends State<ProduitCardPanier>{
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          color: Color(0xFFF5F5F5),
          child: InkWell(
            splashColor: Color(0xFFF5F5FF),
            onTap: () {
              Navigator.pushNamed(context, '/produit', arguments: widget.produit);
            },
            child: Container(
              width: width * 0.95,
              child: Padding( 
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                      child: Container(
                        width: width * 0.2, 
                        height: height * 0.15,
                        child: Image.network(widget.produit.imageUrl, )
                        ),
                      ),
      
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: width * 0.45,
                          child: Text(
                            widget.produit.titre,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: kPrimaryColorS, 
                                  fontSize: kTextSizeTitle
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                                if(widget.produit.nbrDemande > 1){
                                  setState(moinsProduit);
                                  Navigator.popAndPushNamed(context, '/panier');
                                }
                            },
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        color: kTextColor, 
                                        fontSize: 30
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.04,),
                          Text(
                            widget.produit.nbrDemande.toString(),
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: kTextColor, 
                                  fontSize: 26
                              )
                            ),
                          ),
                          SizedBox(width: width * 0.04,),
                          GestureDetector(
                            onTap: () {
                                setState(plusProduit);
                                Navigator.popAndPushNamed(context, '/panier');
                            },
                            child: Container(
                              height: width * 0.1,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        color: kTextColor, 
                                        fontSize: 30
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Row(
                          children: [
                            SizedBox(width: width * 0.105),
                            GestureDetector(
                              onTap: () {
                                  setState(setsomme);
                                  Navigator.popAndPushNamed(context, '/panier');
                              },
                              child: Text(
                                'X',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      color: Colors.redAccent, 
                                      fontSize: kTextSizeTitle
                                  )
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: width * 0.18,
                        child: Text(
                        widget.produit.prix.toString()+'0.Dh',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: kTextColorTitle, 
                              fontSize: kTextSize
                          )
                          ),
                    ),
                      ),
                      
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void moinsProduit() {
    widget.produit.nbrDemande--;
    Panier.somme = calculeSommePanier(Panier.listProduitsPanier);
  }

  void setsomme() {
    Panier.listProduitsPanier.remove(widget.produit);
    Panier.somme = calculeSommePanier(Panier.listProduitsPanier);
  }

  void plusProduit() {
    widget.produit.nbrDemande++;
    Panier.somme = calculeSommePanier(Panier.listProduitsPanier);
  }
}