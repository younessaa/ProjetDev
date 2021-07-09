import 'package:arijephyto/admin/notifier/user_notifier.dart';
import 'package:arijephyto/admin/services/user_service.dart';
import 'package:arijephyto/components/idClass.dart';
import 'package:arijephyto/components/logicFunctions.dart';
import 'package:arijephyto/constants.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:arijephyto/services/firebase_auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../nav-draw.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController ville = TextEditingController();
  TextEditingController pays = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController tele = TextEditingController();
  TextEditingController codePostale = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController motDePass = TextEditingController();
  TextEditingController motDePass2 = TextEditingController();
  double heightF = 5;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UsersNotifier userNotifier = Provider.of<UsersNotifier>(context);
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
                          'Cree Compte',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                          ),
                        ),
            ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                height: 100,
                margin: EdgeInsets.all(15),
                child: Image.asset(
                  "assets/images/arijePhyto-c.jpg",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Center(
                  child: Text(
                    "créer un compte",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              inputField("Prenom", prenom),
              SizedBox(height: heightF,),

              inputField("Nom", nom),
              SizedBox(height: heightF,),

              inputField("Adresse", adresse),
              SizedBox(height: heightF,),

              inputField("Ville", ville),
              SizedBox(height: heightF,),

              inputField("Region", region),
              SizedBox(height: heightF,),
              
              inputField("Code Postale", codePostale),
              SizedBox(height: heightF,),

              inputField("Pays", pays),
              SizedBox(height: heightF,),

              inputField("Telephone", tele),
              SizedBox(height: heightF,),

              inputField("Email", email),
              SizedBox(height: heightF,),

              inputField("Mot de passe", motDePass, isObscureText: true),
              SizedBox(height: heightF,),

              inputField("Confirmer mot de passe", motDePass2, isObscureText: true),
              SizedBox(height: heightF,),

              Padding(
                padding: const EdgeInsets.only(
                    left: 80, top: 15, right: 80, bottom: 0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF6C8DAB),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      if(infosValide(nom, prenom, adresse, ville, pays, region, tele, codePostale, email, motDePass)){
                        if(motDePass.text == motDePass2.text) {
                          try {
                            UserCredential userCredential =
                                await FirebaseHelper.createAccount(
                                    email.text, motDePass.text);
                            if (userCredential.user != null) {
                              await addUser(userNotifier, userCredential.user.uid, prenom.text, nom.text, adresse.text, ville.text, region.text, codePostale.text, pays.text, tele.text, email.text);
                              print("Succed");
                              setState(() {
                              MonCompte.isConnected = true;
                              });
                              idNotifier.setId = userCredential.user.uid;
                              Navigator.popAndPushNamed(context, '/moncompte');
                            }else{
                              setState(() {
                              MonCompte.isConnected = false;
                              });
                            }
                          } catch (e) {
                            setState(() {
                              MonCompte.isConnected = false;
                              });
                            print("Failed !!!!");
                          }
                          
                        }
                        else{
                          showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Verifier le mot de passe'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                        }
                        
                      }
                      else{
                        showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('informations incompletes'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                      }
                      
                        
                    },
                    child: Text("Créer un compte",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 80, top: 20, right: 80, bottom: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  color: kTextColorTitle,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("S'identifier",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBarMeth(-1),
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
