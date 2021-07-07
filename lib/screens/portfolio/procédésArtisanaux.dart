import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class ProcedesArtisanaux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  'Procédés Artisanaux',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
            ),

            body: ListView(
              children : [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        textGreen('Arije Phyto  '),
                        textBlack('vous propose des produits de cosmétiques '),
                        textGreen('Bio '),
                        textBlack('à base de produits naturels de grande qualité.\n\nLa totalité de nos produits sont à base d’Huile d’Argan '),
                        textGreen('Bio '),
                        textBlack(', une huile produite exclusivement au Maroc , et plusieurs autres produits comme '),
                        textGreen('la Rose , Rose Musquée , Lavande ...'), 
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/port11.jpg", width: width * 0.6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        textBlack('Donnant l’exemple '), 
                        textGreen('ARGAN '),
                        textBlack(', Celle-ci est bien connue pour ses multiples bienfaits au niveau de la peau, du cuir chevelu et des cheveux. Elle nourrit la peau sèche et combat le vieillissement pour donner éclat et hydratation naturelle.')
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/images/port12.jpg", width: width * 0.6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        textBlack('le Maroc offre à sa population ainsi qu’au monde un produit unique dont le secret semble renfermé dans les plaines du Souss. Ce produit n’est autre que l’Argan. L’Argan, ainsi que d’autres produits du terroir marocain, a l’avantage d’être garanti d’être BIO en raison de son cantonnement à un espace géographique précis et de la façon dont il pousse. '), 
                        textGreen('Arije Phyto  '),
                        textBlack('partage donc avec vous la saveur du BIO avec cette sélection spéciale produits BIO.')
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              'Laissez un commentaire',
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: kTextSize)),     
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration : BoxDecoration(
                          color: Colors.grey[250],
                          border: Border.all(color: Colors.grey)
                        ),
                        child: TextFormField(
                        maxLines: 5,
                        decoration : const InputDecoration(
                          border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                SizedBox(height: 10.0),

                Padding(
                  padding: EdgeInsets.only(left: width * 0.5, right: 4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor : Color(0xFF6C8DAB),
                      enableFeedback: false,
                    ),
                    onPressed: (){
                    },
                    child: Text(
                      'Soumettre',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextSize,
                        fontWeight: FontWeight.bold
                      ),
                    ) 
                  ),
                )
              ]
            )
    )
    ,
  );
  }

  TextSpan textBlack(String string) {
    return TextSpan(
                      text: string,
                      style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                    );
  }

  TextSpan textGreen(String string) {
    return TextSpan(
                      text: string,
                      style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                    );
  }

  
}