import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class AutoriseONSSA extends StatelessWidget {
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
                  'Autorisé ONSSA',
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
                        textBlack('Notre Coopérative '),
                        textGreen('Arije Phyto '),
                        textBlack('est accréditées et reconnues par cet établissement '),
                        textGreen('L’Office National de Sécurité Sanitaire des Produits Alimentaires (ONSSA) '),
                        textBlack('opérant dans le secteur alimentaire, et ce conformément aux dispositions de la loi n°28-07 relative à la sécurité sanitaire des produits alimentaires, ainsi que le décret pris pour son application, rendant obligatoire l’autorisation sanitaire pour l’exercice de nos activités.'),
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