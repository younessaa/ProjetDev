import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class Welcome extends StatefulWidget{
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                  child: Image.asset("assets/images/arijePhyto-c.jpg",),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Arije Phyto',
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                      ),
                      TextSpan(
                        text: ' est une Marque Marocaine de produits cosmétiques naturels qui traduit le concept « Vivre Au Naturel  » , En effet la Présentation d’Arije Phyto qui est une gamme de produit cosmétique naturels a 100% , sans aucun additif , ni colorant , ni parfum chimique . Nous avons toute la gamme qui englobe les produits pour : Visage , Corps et Cheveux .',
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                blurRadius: 25,
                                offset: Offset(0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                padding: const EdgeInsets.only(left: 15, right: 15),
                height:  height * 0.07,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                          child: Text('C’est parti',
                                  style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                ),
                          onPressed: () {
                            setState(() {
                              MonCompte.isConnected = false;
                            });
                            Navigator.popAndPushNamed(context, '/home');
                          },
                          style: TextButton.styleFrom(backgroundColor: kPrimaryColor, enableFeedback: true,),
                        ),    
                ),
              ),
            ],
        ),
    );
  }
}