import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class Naturel extends StatelessWidget {
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
                  '100 % Naturel',
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
                        textGreen('Arije Phyto '),
                        textBlack('vous propose des soins véritablement efficaces, qui n’ont rien à cacher. Il est hors de question pour nous, de proposer des produits qui misent sur la mauvaise crédibilité pour faire croire qu’ils sont efficaces. Nous utilisons uniquement des matières premières naturelles, saines et de grande qualité – jamais d’ingrédients de remplissage dénués d’intérêt pour la peau.'),
                        textGreen('\nDes ingrédients 100% naturels et 100% bio : \n\n'),
                        textBlack('Il s’agit bien trop souvent d’une liste de noms simples et compréhensibles en priorité : \n'),
                        textGreen('Rose , Rose Musquée , Lavande , Argan , Rhassoul , Fleurs d’Orangers ,  Henné'),
                        textBlack('… . Difficile de savoir lesquels sont bons, pas terribles, néfastes ou simplement utiles ou non pour notre peau… Notre conviction chez '),
                        textGreen('Arije Phyto '),
                        textBlack(', c’est qu’il faut faire un grand ménage dans tous ces composants cosmétiques. C’est pourquoi '),
                        textGreen('nos formules ne contiennent que des ingrédients naturels ou d’origine naturelle, tous bio.\n')
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