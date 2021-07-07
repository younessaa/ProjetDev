import 'package:arijephyto/components/dataLists.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:arijephyto/models/listsOffresPorts.dart';
import 'package:flutter/material.dart';
import '../nav-draw.dart';


class Portfolio extends StatefulWidget{
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBarMeth(height, width, 'Portfolio'),

            body: ListPortfoliosV(vertical: true, list: imgListPort,),

            bottomNavigationBar: BottomNavyBarMeth(-1),
    )
    ,
  );
  }
}