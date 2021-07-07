import 'package:arijephyto/components/dataLists.dart';
import 'package:arijephyto/components/lists.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/models/listsOffresPorts.dart';
import 'package:arijephyto/models/blogCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../nav-draw.dart';


// ignore: must_be_immutable
class  Home extends StatefulWidget {
  int currentIndex = 0;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
      return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBar(height, width),

            body: Center(
                  child: ListView(
                  children: [

                    ListOffres(imgListOffres, Colors.greenAccent),

                    SizedBox(height: height * 0.05),

                    ListPortfolios(),

                    SizedBox(height: height * 0.03),
                    Center(
                      child: Text(
                        'Derniers articles',
                        style: GoogleFonts.ruda(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: kTextColor, 
                            fontSize: kTextSize
                        )
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    Column(
                      children: blogList.map((e) => BlogCard(e)).toList(),
                    )
                    

                  ],
                  )
            ),

            bottomNavigationBar: BottomNavyBarMeth(0),
    )
    ,
  );
  }

  
}