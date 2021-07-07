import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';


class AproposDe extends StatelessWidget {
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
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    )
                  ),
                  title: Text(
                  'À Propos De',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
          ),

            body: Center(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: BorderDirectional(bottom: BorderSide(width: 1 ,color: Colors.grey))
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Arije Phyto : ',
                                style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset("assets/images/arijePhyto-c.jpg", width: width * 0.5,),
                            ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BorderDirectional(bottom: BorderSide(width: 1 ,color: Colors.grey))
                        ),
                        child: Column(
                          children: [
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Arije Phyto ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'est une Marque Marocaine de produits cosmétiques naturels qui traduit le concept « Vivre Au Naturel  » , En effet la Présentation d’Arije Phyto qui est une gamme de produit  cosmétique naturels a 100% , sans aucun additif , ni colorant , ni parfum chimique . Nous avons toute la gamme qui englobe les produits pour : ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Visage , Corps et Cheveux .',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: ' Parmi ces produits Sont Des ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Huile Essentielles',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: ' , Crèmes , Des synergie , Des Hydrolats ,  Des préparation pour des problèmes De Chute De Cheveux , d’acné  …',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                ],
                              ),
                            ), 
                    ),
                    SizedBox(height: 10,),
                    Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Ces produits sont destinés aux HOMME et FEMME , Nous avons aussi lancé la première ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Gamme Marocaine ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: '100% naturels destiné aux Bébés . La 2 -ème catégorie de produits que nous avons aussi lancé la gamme Agro-alimentaire « ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Bio Morocco',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: ' » . Celle-Ci comporte plusieurs Produits :',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Miels , Huile d’Olive Aromatisé aux plantes : Basilic , Cumin , Thym , Marjolaine , Huile D’Argan ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: ', Les Epices aussi qui traduisent le gout de l’art culinaire marocaine ( Tagine , Harira , Couscous …)  Les Tisanes aussi qui nous rappellent les boissons marocaines traditionnelles (Thé-Menthe , Oranger .. ) ainsi que des compléments alimentaires naturel a la base de graines et de fruit secs. Nos Produits  sont 100% naturels  et Bios et ceci est leur avantage majeur .',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                ],
                              ),
                            ), 
                    ),
                    SizedBox(height: 20,),
                    Center(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset("assets/images/aproposde1.jpg", width: width * 0.7,),
                            ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Arije Phyto ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'est accrédité par la coopérative ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'ONSSA :L’Office National de Sécurité Sanitaire des Produits Alimentaires ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'exerce, pour le compte de l’Etat, les missions et attributions relatives à la protection de la santé du consommateur et à la préservation de la santé des animaux et des végétaux.',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                ],
                              ),
                            ), 
                    ),
                    SizedBox(height: 20,),
                    Center(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset("assets/images/aproposde2.jpg", width: width * 0.7,),
                            ),
                    ),
                    SizedBox(height: 20,),
                          ],
                        ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dr BENJELLOUN Fatima Zohra : \n\nArije Phyto',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: ' : crée par ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Dr BENJELLOUN Fatima Zohra ',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'PhD spécialiste en Biologie médicale et pathologie humaine et expérimentale et environnement. Elle a terminé ses études à l’Institut agronomique et vétérinaire Hassan II (IAV) qui l’ont permis d’être en contact direct avec la nature, de la comprendre en profondeur, de  manipuler, toucher, expérimenter et étudier. Elle a eu une maturité professionnelle en matière des procédés de laboratoire et en qualité durant Son parcours au Laboratoire régional d’analyse et de recherche de Casablanca , et aussi à l’ONSSA\n\n',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                  TextSpan(
                                    text: 'Par la suite,  durant sa spécialité en PhD Biologie médicale et pathologie humaine à la Faculté de médecine de Rabat,  Elle a découvert que la majorité de des problèmes est due à notre mode vie, de notre environnement dans lequel nous vivons, de ce que nous mangeons et de ce que nous mettons sur notre peau. Et que la solution réside dans un retour à la nature et de s’éloigner de tout ce qui est chimique et modifié génétiquement.',
                                    style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                                  ),
                                ],
                              ),
                            ), 
                    ),
                    SizedBox(height: 20,),
                    Center(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset("assets/images/aproposde4.jpg", width: width * 0.7,),
                            ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset("assets/images/aproposde3.jpg", width: width * 0.8,),
                            ),
                    ),
                  ],
                    )
            ),
    )
    ,
  );
  }
}