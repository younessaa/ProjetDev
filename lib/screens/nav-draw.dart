import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        height: height * 0.9,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("assets/images/arije.png",),
              decoration: BoxDecoration(
                  color: Colors.white,
                  
                ),
            ),
            listTileItem(context, 'Mon compte', width, height, MonCompte.person.getEmail == null ? '/signup' : '/moncompte'),
            listTileItem(context, 'Portfolio', width, height, '/portfolio'),
            listTileItem(context, 'PROMO', width, height, '/promo'),
            listTileItem(context, 'Catégories', width, height, '/categories'),
            listTileItem(context, 'Contact', width, height, '/contact'),
            listTileItem(context, 'À Propos De', width, height, '/aproposde'),
            listTileItem(context, 'Déconnexion', width, height, '/login'),
          ],
        ),
      ),
    );
  }

  GestureDetector listTileItem(BuildContext context, String string,double width, double height, String path) {
    return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, path);
      },
      child: Container(
        height: height * 0.075,
        decoration: BoxDecoration(
          color: Color(0xFFDEFFD6),
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 4))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Text(string,
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorB, fontSize: kTextSize)),
              ),
            ),
            SizedBox(height: height * 0.06,),
            Padding(
              padding: EdgeInsets.only(right: width * 0.05),
              child: FaIcon(FontAwesomeIcons.angleRight),
            ),
          ],
        ),
      ),
    );
  }
}