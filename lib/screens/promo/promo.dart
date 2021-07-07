import 'package:arijephyto/components/dataLists.dart';
import 'package:arijephyto/components/lists.dart';
import 'package:arijephyto/models/listsOffresPorts.dart';
import 'package:arijephyto/models/promoCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'PROMO',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                  ),
            ),

            body: ListView(
              children: [
                ListOffres(imgListPromos1, Colors.greenAccent),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 14, top: 14),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Découvrez chaque mois de nouvelles promotions chez ',
                          style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                        ),
                        TextSpan(
                          text: 'Arije Phyto',
                          style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: kTextSize)),
                        ),
                        TextSpan(
                          text: ' conçues pour vous ! Et pour recevoir des offres personnalisées, accéder à des ventes privées ou à des offres exclusives, abonnez-vous à Facebook et Instagram , nous vous enverrons nos meilleures offres.',
                          style: GoogleFonts.reemKufi(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: kTextSize)),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                children: listProduitsPromo.map(
                  (item) => PromoCard(item)
                ).toList(),
                ),
                SizedBox(height: 20,)
              ],
              )
    )
    ,
  );
  }
}