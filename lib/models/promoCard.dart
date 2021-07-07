import 'package:arijephyto/components/classElement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';


class PromoCard extends StatefulWidget {
  final Produit produit;
  PromoCard(this.produit);
  @override 
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard>{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Color(0xFFECF0ED),
        child: InkWell(
          splashColor: Color(0xFFECF0ED),
          onTap: () {},
          child: Container(
            width: width * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: width * 0.45,
                          child: Text(
                            widget.produit.prodTitle,
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.25, 
                            height: height * 0.15,
                            child: Image.asset(widget.produit.prodImage, )
                          ),
                          Text(
                              widget.produit.prodPrix.toString() + '0 Dh',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, 
                                    color: Color(0xFF787878), 
                                    fontSize: kTextSize
                                )
                                ),
                          ),
                          Text(
                              widget.produit.lastPrix.toString() + '0 Dh',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xFF787878), 
                                    fontSize: 16
                                )
                                ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.produit.prodText.split(':')[0].substring(0, 11),
                                style: GoogleFonts.reemKufi(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColorS, 
                                      fontSize: 18
                                  )
                                )
                            ),
                            TextSpan(
                              text: widget.produit.prodText.split(':')[0].substring(11),
                                style: GoogleFonts.reemKufi(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: kTextColorB, 
                                      fontSize: 18
                                  )
                                )
                            ),
                            TextSpan(
                              text: widget.produit.prodText.split(':')[1],
                                style: GoogleFonts.reemKufi(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColorS, 
                                      fontSize: 18
                                  )
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
    ),
  );
 }
}