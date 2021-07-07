import 'package:arijephyto/components/produit_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';


class ProduitCardAdm extends StatefulWidget {
  final ProduitModel produit;
  ProduitCardAdm(this.produit);
  @override 
  _ProduitCardAdmState createState() => _ProduitCardAdmState();
}

class _ProduitCardAdmState extends State<ProduitCardAdm>{
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
          },
          child: Container(
            width: width * 0.8,
            child: Padding( 
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        child: Container(
                          width: width * 0.25, 
                          height: height * 0.15,
                          child: Image.network(widget.produit.imageUrl,),

                          ),
                        ),
    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Container(
                            width: width * 0.35,
                            child: Text(
                              widget.produit.titre,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: kTextColorTitle, 
                                    fontSize: kTextSizeTitle
                                )
                                ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                        widget.produit.prix.toString()+'0 Dh',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.normal, 
                              color: kTextColorTitle, 
                              fontSize: kTextSize
                          )
                          ),
                      ),
                        
                      ],
                    ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text(
                          'Quantite de Stock \n\t' + widget.produit.qntStock.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: kTextColorTitle, 
                              fontSize: 16
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Categorie \n\t' + widget.produit.categorie,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, 
                              color: kTextColorTitle, 
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
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
}