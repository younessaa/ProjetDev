import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';


AppBar appBar(double height, double width) {
    return AppBar(
                  leading: Builder(builder : (context) => GestureDetector(
                    child:  Center(child:  FaIcon(FontAwesomeIcons.alignLeft)
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )
                  ),
                  automaticallyImplyLeading: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.05,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kDefaultRadius),
                          color: Colors.white,
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: TextFormField(
                            maxLines: 1,
                            enableInteractiveSelection : false,
                            enableSuggestions : true,
                            decoration : const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cherchez ici !',
                              suffixIcon: Icon(
                                Icons.search,
                                size: kIconSize,
                                color: kIconColorU,
                            ),
                            ),
                          ),
                        ),
                        ),
                    ],
                  ),
                  actions: <Widget>[
                    
                    Padding(
                      padding: EdgeInsets.only(right: height * 0.02),
                      child: Builder(builder : (context) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MonCompte.person.getEmail == null ? '/signup' : '/moncompte');
                        },
                        child: Icon(
                          Icons.person,
                          size: kIconSize,
                        ),
                      )
                      )
                    ),
                  ],
          );
  }


AppBar appBarMeth(double height, double width, String title) {
    return AppBar(
                  leading: Builder(builder : (context) => GestureDetector(
                    child:  Center(child:  FaIcon(FontAwesomeIcons.alignLeft)
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )
                  ),
                  automaticallyImplyLeading: true,
                  title: Center(
                    child: Text(
                    title,
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColor, fontSize: kTextSize)),
                    ),
                  ),

                  actions: <Widget>[
                    
                    Padding(
                      padding: EdgeInsets.only(right: height * 0.02),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                                Icons.search,
                                size: kIconSize,
                                color: kIconColorU,
                            ),
                      )
                    ),
                  ],
          );
  }

  