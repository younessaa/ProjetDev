import 'package:arijephyto/admin/models/produitCardA.dart';
import 'package:arijephyto/admin/models/AdminBottomNavBar.dart';
import 'package:arijephyto/admin/notifier/produits_notifier.dart';
import 'package:arijephyto/admin/services/produits_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';


class AdminScreenProduits extends StatefulWidget{
  @override
  _AdminScreenProduitsState createState() => _AdminScreenProduitsState();
}

class _AdminScreenProduitsState extends State<AdminScreenProduits> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProduitsNotifier produitsNotifier = Provider.of<ProduitsNotifier>(context);
    getProduits(produitsNotifier);
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
                          'Produits',
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kTextColorTitle, fontSize: kTextSize)),
                          ),
                        ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addProduit');
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),

            body: ListView.builder(
              itemCount: produitsNotifier.produits.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    produitsNotifier.currentProduit = produitsNotifier.produits[index];
                    Navigator.pushNamed(context, '/addProduit', arguments: {
                      'produit' : produitsNotifier.produits[index]
                    });
                  },
                  child: ListTile(
                    title: ProduitCardAdm(produitsNotifier.produits[index]),
                    trailing: GestureDetector(
                      onTap: () async {
                        await deleteProduit(produitsNotifier, produitsNotifier.produits[index]);
                      },
                      child: Icon(Icons.delete, color: Colors.redAccent,),
                    ),
                  ),
                );
              },
            ),
            bottomNavigationBar: BottomNavBarAdm(0),
    )
    ,
  );
  }
}