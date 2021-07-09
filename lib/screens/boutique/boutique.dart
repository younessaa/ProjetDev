import 'package:arijephyto/admin/notifier/produits_notifier.dart';
import 'package:arijephyto/admin/services/produits_service.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/models/produitCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../nav-draw.dart';


class Boutique extends StatefulWidget{
  @override
  _BoutiqueState createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique> {
  @override
  Widget build(BuildContext context) {
    ProduitsNotifier produitsNotifier = Provider.of<ProduitsNotifier>(context);
    getProduits(produitsNotifier);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBarMeth(height, width, 'Boutique', list: produitsNotifier.produits),

            body: new ListView.builder(
              itemCount: produitsNotifier.produits.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Padding(padding: EdgeInsets.only(bottom: 15), child : ProduitCard(produitsNotifier.produits[index]));
              }
            ),
            bottomNavigationBar: BottomNavyBarMeth(1),
    )
    ,
  );
  }
  
}
