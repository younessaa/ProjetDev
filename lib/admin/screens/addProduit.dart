import 'package:arijephyto/admin/notifier/produits_notifier.dart';
import 'package:arijephyto/components/produit_model.dart';
import 'package:arijephyto/admin/services/produits_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';


class AjouterProduit extends StatefulWidget{
  final Map<String, dynamic> args;
  const AjouterProduit({Key key, this.args}) : super(key: key);
  
  @override
  _AjouterProduitState createState() => _AjouterProduitState();
}

class _AjouterProduitState extends State<AjouterProduit> {
  
  ProduitModel produit;
  TextEditingController titre = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController qntStock = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  TextEditingController descirption = TextEditingController();
  TextEditingController text = TextEditingController();
  TextEditingController categorie = TextEditingController();
  double heightF = 5;
  
  @override
  void initState() {
    if (widget.args != null) {
      titre.text = widget.args['produit'].titre;
      prix.text = widget.args['produit'].prix;
      qntStock.text = widget.args['produit'].qntStock;
      imageUrl.text = widget.args['produit'].imageUrl;
      descirption.text = widget.args['produit'].descirption;
      text.text = widget.args['produit'].text;
      categorie.text = widget.args['produit'].categorie;
      
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProduitsNotifier produitsNotifier = Provider.of<ProduitsNotifier>(context);
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColorTitle,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    )
                  ),
                        title: Center(
                          child: Text(
                          'Ajouter Produit',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                          ),
                        ),
            ),

            body: Center(
              child: ListView(
                children: [
                  SizedBox(height: heightF,),
                  inputField("titre", titre),
                  SizedBox(height: heightF,),
                  
                  inputField("prix", prix),
                  SizedBox(height: heightF,),

                  inputField("qntStock", qntStock),
                  SizedBox(height: heightF,),
                  
                  inputField("imageUrl", imageUrl),
                  SizedBox(height: heightF,),
                  
                  inputField("descirption", descirption),
                  SizedBox(height: heightF,),

                  inputField("text", text),
                  SizedBox(height: heightF,),

                  inputField("categorie", categorie),
                  SizedBox(height: heightF,),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blueGrey[100], enableFeedback: true,),
                    onPressed: () async {
                      if (titre.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text("Field cannot be empty"),
                          duration: new Duration(
                            seconds: 5,
                          ),
                        ));
                      } else {
                        if (widget.args == null) {
                          await addProduit(produitsNotifier, titre.text, double.parse(prix.text), int.parse(qntStock.text), imageUrl.text, descirption.text, text.text, 1, categorie.text);
                        } else {
                          await updateProduits(produitsNotifier, titre.text, double.parse(prix.text), int.parse(qntStock.text), imageUrl.text, descirption.text, text.text, 1, categorie.text);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text('Le produit a bien été ajouté !'),
                          duration: new Duration(seconds: 10),
                          action: SnackBarAction(
                            label: "Ok",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ));
                      }
                    },
                    child: Container(
                      child: Text(
                        widget.args == null ? 'Add' : 'Edit',
                      ),
                    )
                    ),
                  )

                ],
              ),
            )
    )
    ,
  );
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