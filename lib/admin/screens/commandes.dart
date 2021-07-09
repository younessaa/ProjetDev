import 'package:arijephyto/admin/models/AdminBottomNavBar.dart';
import 'package:arijephyto/admin/models/commandeCard.dart';
import 'package:arijephyto/admin/notifier/commandes_notifier.dart';
import 'package:arijephyto/admin/services/commandes_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';


class Commandes extends StatefulWidget{
  @override
  _CommandesState createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  @override
  Widget build(BuildContext context) {
    CommandesNotifier commandesNotifier = Provider.of<CommandesNotifier>(context);
    getCommandes(commandesNotifier);
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

            body: ListView.builder(
              itemCount: commandesNotifier.commandes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    commandesNotifier.currentCommande = commandesNotifier.commandes[index];
                    
                  },
                  child: ListTile(
                    title: CommandeCardAdm(commandesNotifier.commandes[index]),
                    trailing: GestureDetector(
                      onTap: () async {
                        await deleteCommande(commandesNotifier, commandesNotifier.commandes[index]);
                      },
                      child: Icon(Icons.delete, color: Colors.redAccent,),
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar: BottomNavBarAdm(1),
    )
    ,
  );
  }
}