import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../nav-draw.dart';


class Categories extends StatefulWidget{
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBarMeth(height, width, 'Catégories'),

            body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Choisir une catégorie',
                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8F8C8C), fontSize: kTextSize)),
              ),
            ),
            listTileItem(context, 'Accessoires', width, height, 0),
            listTileItem(context, 'Aromathérapie', width, height, 1),
            listTileItem(context, 'Corps', width, height, 2),
            listTileItem(context, 'Enfants', width, height, 3),
            listTileItem(context, 'Cheveux', width, height, 4),
            listTileItem(context, 'Visage', width, height, 5),
            listTileItem(context, 'Paniers Cadeaux', width, height, 6),
            listTileItem(context, 'Huiles nourissantes', width, height, 7),
          ],
        ),

            bottomNavigationBar: BottomNavyBarMeth(2),
    )
    ,
  );
  }

  GestureDetector listTileItem(BuildContext context, String string,double width, double height, int i) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/categorieScreen', arguments: i);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFD6D6D6).withOpacity(0.8),
          border: Border(bottom: BorderSide(color: Colors.grey[500], width: 2))
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(string,
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: FaIcon(FontAwesomeIcons.angleRight, color: kTextColorTitle,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}