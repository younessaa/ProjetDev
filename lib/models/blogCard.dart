import 'package:arijephyto/components/classElement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class BlogCard extends StatefulWidget {
  final Blog blog;
  BlogCard(this.blog);
  @override 
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard>{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Center(
    child: Card(
      color: Color(0xFFF5F5F5),
      child: InkWell(
        splashColor: Color(0xFFF5F5F5),
        onTap: () {
          //Navigator.pushNamed(context, '/blogscreen', arguments: widget.blog);
        },
        child: Container(
          //height: height * 0.42,
          width: width * 0.95,
          child: Padding( 
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children : [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/blogscreen', arguments: widget.blog);
                    },
                    child: Image.asset(widget.blog.blogImage, width: width * 0.2, )),
                  Center(
                    child: Container(
                      width: width * 0.4,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/blogscreen', arguments: widget.blog);
                          },
                          child: Text(
                            widget.blog.blogTitle,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: kTextColorTitle, 
                                  fontSize: 18
                              )
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        widget.blog.blogTime,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.normal, 
                            color: Colors.black, 
                            fontSize: 14
                        )
                        ),
                      ),
                      ),
                  )
                  ]
                ),
                SizedBox(height : height * 0.02),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.blog.blogDescription.substring(0, 200) + '...',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.normal, 
                            color: Colors.black, 
                            fontSize: 18,
                        )
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/blogscreen', arguments: widget.blog);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.5),
                    child: Text(
                        'Pour en savoir plus',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: kPrimaryColorS, 
                                fontSize: 18
                            )
                        ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
 }
}