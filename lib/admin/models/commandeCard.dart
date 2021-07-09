import 'package:arijephyto/components/commande_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommandeCardAdm extends StatefulWidget {
  final CommandeModel commande;
  CommandeCardAdm(this.commande);
  @override 
  _CommandeCardAdmState createState() => _CommandeCardAdmState();
}

class _CommandeCardAdmState extends State<CommandeCardAdm>{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Color(0xFFF5F5F5),
        child: InkWell(
          splashColor: Color(0xFFF5F5FF),
          onTap: () {
          },
          child: Container(
            width: width * 0.8,
            child: Padding( 
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  rowText(width, 'Nom et prenom : '+ widget.commande.fullName),
                  rowText(width, 'Adresse : '+ widget.commande.adresse),
                  rowText(width, 'Email : '+ widget.commande.email),
                  rowText(width, 'Tele : '+ widget.commande.tele),
                  rowText(width, 'noms Produits : '+ widget.commande.produitsId),
                  rowText(width, 'prix : '+ widget.commande.prix.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
 }

Column rowText(double width, String string1) {
  return Column(
                  children: [
                    Container(
                      width: width * 0.6,
                      child: Text(
                        string1,
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18)),
                      ),
                    ),
                    SizedBox(height: 5,),
                    
                  ],
                );
}
}