import 'package:arijephyto/admin/notifier/user_notifier.dart';
import 'package:arijephyto/admin/services/user_service.dart';
import 'package:arijephyto/components/classElement.dart';
import 'package:arijephyto/components/idClass.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class MonCompte extends StatefulWidget {
  static Person person;
  static bool isConnected = false;
  @override
  _MonCompteState createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  @override
  Widget build(BuildContext context) {
    UsersNotifier userNotifier = Provider.of<UsersNotifier>(context);
    IdNotifier idNotifier = Provider.of<IdNotifier>(context);
    getUser(userNotifier, idNotifier.currentId);
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
              leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColorTitle,),
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    )
                  ),
                  title: Text(
                  'Mon Compte',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                  ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height : 15),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFF5F5FF)
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Mes informations :',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  textRow('Pr??nom :', userNotifier.currentUser.getPrenom, width),
                  textRow('Nom :', userNotifier.currentUser.getNom, width),
                  textRow('Adresse :', userNotifier.currentUser.getAdresse, width),
                  textRow('Email :', userNotifier.currentUser.getEmail, width),
                  textRow('Telephone :', userNotifier.currentUser.getTele, width),

                ],
              ),
            ),
            SizedBox(height : 20),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    autofocus: true,
                    style: TextButton.styleFrom(
                      backgroundColor : Color(0xFF6C8DAB),
                      enableFeedback: false,
                    ),
                    onPressed: (){
                    },
                    child: Text(
                      'Modifier mes infos',
                      style: TextStyle(
                        color: kTextColorB,
                        fontSize: kTextSize,
                        fontWeight: FontWeight.bold
                      ),
                    ) 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor : Color(0xFF6C8DAB),
                      enableFeedback: false,
                    ),
                    onPressed: (){
                    },
                    child: Text(
                      'Changer le mot de passe',
                      style: TextStyle(
                        color: kTextColorB,
                        fontSize: kTextSize,
                        fontWeight: FontWeight.bold
                      ),
                    ) 
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBarMeth(-1),
    ));
  }

  Row textRow(String name, String value, double width) {
    return Row(
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(name??'jj',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(value??'null',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),
                        ),
                      ),
                    ),
                  ],
                );
  }
}
