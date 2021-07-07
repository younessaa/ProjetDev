import 'package:arijephyto/admin/models/AdminBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';


class Commandes extends StatefulWidget{
  @override
  _CommandesState createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: (){

                },
                child: Icon(
                  Icons.admin_panel_settings
                ),
              ),
                        title: Center(
                          child: Text(
                          'Commandes',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                          ),
                        ),
            ),

            body: Center(
              child : Text(
                'Pas de commandes'
              )
            ),
            bottomNavigationBar: BottomNavBarAdm(1),
    )
    ,
  );
  }
}