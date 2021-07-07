import 'package:arijephyto/constants.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:arijephyto/services/firebase_auth_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      drawer: NavDrawer(),
      appBar: appBarMeth(height, width, "Log in"),
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
                        if(email.text == null || motDePass.text == null){
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
                              if(userCredential.user.email == "y1o2u3n4@gmail.com" && userCredential.user.uid == "VdIBMVYLv8RI2mK6iW2MXi8mEkv1"){
                                Navigator.popAndPushNamed(context, '/produitsAdmin');
                              }
                              else{
                                Navigator.popAndPushNamed(context, '/moncompte');
                              } 
                            }
                            else{
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
                Center(child: Text("Mot de passe oublié ?")),
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
                      child: Text("Créer un compte",
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
