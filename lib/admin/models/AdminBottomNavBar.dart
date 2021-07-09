import 'package:arijephyto/screens/signup/compteInfo.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class BottomNavBarAdm extends StatefulWidget{
  final int currentIndex;
  BottomNavBarAdm(this.currentIndex);
  @override
  _BottomNavBarAdmState createState() => _BottomNavBarAdmState();
}

class _BottomNavBarAdmState extends State<BottomNavBarAdm> {
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
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.store), 'Produits', '/produitsAdmin', 0),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.tasks), 'Commandes', '/commandesAdmin', 1),
              bottomNavBarItem(context, FaIcon(FontAwesomeIcons.signOutAlt), 'LogOut', '/boutique', 2),
            ],
          );
  }

  BottomNavyBarItem bottomNavBarItem(BuildContext context, Widget icon, String name, String path, int index) {
    return BottomNavyBarItem(
              icon: GestureDetector(
                child: icon,
                onTap: () {
                  if(path == '/boutique'){
                    MonCompte.isConnected = false;
                    MonCompte.person = null;
                  }
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