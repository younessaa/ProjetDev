import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    )
                  ),
                  title: Text(
                  'Contactez-nous',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
            ),

            body: ListView(
              children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Vous avez une question ou vous avez besoin d’une information ',
                        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                      ),
                      TextSpan(
                        text: 'Arije Phyto',
                        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                      ),
                      TextSpan(
                        text: '  met tout en œuvre pour répondre à vos questions et satisfaire vos demandes. N’hésitez pas à contacter .',
                        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                      ),
                    ],
                  ),
                ), 
              ),
              SizedBox(height: 20,),
              textConta('Adresse : ', '112, lot La Gare , Alia , Mohammedia – Maroc.', width),
              textConta('Telephone Fixe : ', '0523281669', width),
              textConta('Telephone mobile : ', '0689233403', width),
              textConta('Email : ', 'arije.phyto@gmail.com', width),
              SizedBox(height: 60,),

              Center(
                child: Text(
                  'Contactez-Nous : ',
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorB, fontSize: kTextSizeTitle)),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Les champs marqués d’un ',
                        style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                      ),
                      TextSpan(
                        text: '*',
                        style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: kTextSize)),
                      ),
                      TextSpan(
                        text: '  sont obligatoires',
                        style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                      ),
                    ],
                  ),
                ), 
              ),

              fieldTitle('Nom '),
              fieldText(1),
              fieldTitle('Email '),
              fieldText(1),
              fieldTitle('Message '),
              fieldText(6),

              Padding(
                padding: EdgeInsets.only(left: width *0.5, right: 8),
                child: TextButton(
                        child: Text('Soumettre',
                                style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: kTextSize)),
                              ),
                        onPressed: () {
                        },
                        style: TextButton.styleFrom(backgroundColor: Color(0xFF6C8DAB), enableFeedback: false,),
                      ),
              ),
              SizedBox(height: 60,),

              Center(
                child: Text(
                  'Suivez nous  :',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorTitle, fontSize: kTextSizeTitle)),),
              ),
              SizedBox(height: 20,),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialMedia(width, height, FaIcon(FontAwesomeIcons.facebookF, color: Colors.white,), Color(0xFF3B5998)),
                    SizedBox(width: 10,),
                    socialMedia(width, height, FaIcon(FontAwesomeIcons.instagram, color: Colors.white,), Color(0xFF517FA4)),
                    SizedBox(width: 10,),
                    socialMedia(width, height, FaIcon(FontAwesomeIcons.youtube, color: Colors.white,), Color(0xFFFF3333)),
                  ],
                  ),
              ),
              SizedBox(height: 60,),
              ],
              )
    )
    ,
  );
  }

  Container socialMedia(double width, double height, Widget icon, Color color) {
    return Container(
                    width: width * 0.16,
                    height: height * 0.08,
                    decoration: BoxDecoration(
                        color: color,
                        ),
                    child: Center(child: icon),
                  );
  }

  Padding fieldText(int maxlignes) {
    return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kDefaultRadius),
                          color: Color(0xFFDEDEDE),
                          ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              maxLines: maxlignes,
                              decoration : const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        ),
            );
  }

  Padding fieldTitle(String string) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: string,
                      style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorB, fontSize: kTextSize)),
                    ),
                    TextSpan(
                      text: '*',
                      style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: kTextSize)),
                    ),
                  ],
                ),
              ), 
            );
  }

  Padding textConta(String string1, String string2, double width) {
    return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: Container(
                width: width * 0.8,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: string1,
                        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kPrimaryColor, fontSize: 18)),
                      ),
                      TextSpan(
                        text: string2,
                        style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ), 
            );
  }
}