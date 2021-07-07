import 'package:flutter/material.dart';

import '../constants.dart';

class PortfolioCard extends StatelessWidget {
  final String imgPath;
  final String name;
  const PortfolioCard({
    Key key,
    @required this.width,
    this.imgPath,
    this.name
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Center(child: Image.asset(imgPath, width: width * 0.6,)),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[300],
                        Colors.grey[50]
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
        ]);
  }
}