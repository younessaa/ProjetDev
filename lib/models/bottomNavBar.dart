import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';


class BottomNavyBarMeth extends StatefulWidget{
  final int currentIndex;
  BottomNavyBarMeth(this.currentIndex);
  @override
  _BottomNavyBarMethState createState() => _BottomNavyBarMethState();
}

class _BottomNavyBarMethState extends State<BottomNavyBarMeth> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = widget.currentIndex;
    return BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            backgroundColor: kPrimaryColor,
            curve: Curves.easeIn,
            onItemSelected: (index) {setState(() => _currentIndex = index);} ,
            items: <BottomNavyBarItem>[
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.home), 'Accueil', '/home', 0),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.store), 'Boutique', '/boutique', 1),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.shapes), 'Catégories', '/categories', 2),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.shoppingCart), 'Panier', '/panier', 3),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.blog), 'Blog', '/blogs', 4),
            ],
          );
  }

  BottomNavyBarItem bottomNavBarItem(BuildContext context, Widget icon, String name, String path, int index) {
    return BottomNavyBarItem(
              icon: GestureDetector(
                child: icon,
                onTap: () {
                  if(index != widget.currentIndex)
                    Navigator.popAndPushNamed(context, path);
                }
                ),
              title: Text(name),
              activeColor: Colors.black,
              textAlign: TextAlign.center,
            );
  }
}

