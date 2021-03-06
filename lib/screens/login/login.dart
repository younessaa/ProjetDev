import 'package:arijephyto/components/idClass.dart';
import 'package:arijephyto/constants.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:arijephyto/services/firebase_auth_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../nav-draw.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController motDePass = TextEditingController();
  double heightF = 5;
  UserCredential userCredential;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    IdNotifier idNotifier = Provider.of<IdNotifier>(context);
    return SafeArea(
        child: Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
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
                          "S'identifier",
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                          ),
                        ),
            ),
      bottomNavigationBar: BottomNavyBarMeth(-1),
      body: Center(
        child: Container(
          height: height,
          width: width * 0.83,
          color: kBackground,
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 100,
                  margin: EdgeInsets.all(15),
                  child: Image.asset("assets/images/arijePhyto-c.jpg"),
                ),
                Center(
                  child: Text(
                    "S'identifier",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
                SizedBox(height: heightF,),

                inputField("Email", email),
                SizedBox(height: heightF * 2,),

                inputField("Mot de passe", motDePass, isObscureText: true),
                SizedBox(height: heightF,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 15, right: 20, bottom: 0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF6C8DAB),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        if(email.text == '' || motDePass.text == ''){
                          showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Entrer Emai et mot de passe'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                          );
                        }
                        else{
                          try{
                            userCredential = await FirebaseHelper.signInWithEmailAndPassword(email.text, motDePass.text);
                            if(userCredential != null){
                              MonCompte.isConnected = true;
                              idNotifier.setId = userCredential.user.uid;
                              if(userCredential.user.email == "y1o2u3n4@gmail.com" && userCredential.user.uid == "VdIBMVYLv8RI2mK6iW2MXi8mEkv1"){
                                Navigator.popAndPushNamed(context, '/produitsAdmin');
                              }
                              else{
                                Navigator.popAndPushNamed(context, '/moncompte');
                              } 
                            }
                            else{
                              MonCompte.isConnected = false;
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Email ou mot de passe incorrecte !'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                          );
                            }
                          } catch(e){
                            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: Text("User not found  !!!"),
                            duration: new Duration(
                              seconds: 5,
                            ),
                          ));
                            print('User not found');
                          }
                          
                        }
                      },
                      child: Text("S'identifie",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: Text("Mot de passe oubli?? ?")),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, top: 20, right: 25, bottom: 20),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    color: kTextColorTitle,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/signup');
                      },
                      child: Text("Cr??er un compte",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget inputField(String hintText, TextEditingController controller,
      {bool isObscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        obscureText: isObscureText,
        controller: controller,
        decoration: InputDecoration(hintText: hintText, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

}
