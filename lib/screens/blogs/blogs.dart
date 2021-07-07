import 'package:arijephyto/components/lists.dart';
import 'package:arijephyto/models/appBar.dart';
import 'package:arijephyto/models/blogCard.dart';
import 'package:arijephyto/models/bottomNavBar.dart';
import 'package:flutter/material.dart';
import '../nav-draw.dart';


class Blogs extends StatefulWidget{
  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            drawer: NavDrawer(),
            appBar: appBarMeth(height, width, 'Blogs'),

            body: Center(
                  child: ListView(
                  children: blogList.map((e) => BlogCard(e)).toList(),
                  )
            ),

            bottomNavigationBar: BottomNavyBarMeth(4),
    )
    ,
  );
  }
}