import 'package:arijephyto/components/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommentCard extends StatefulWidget {
  final CommentModel comment;
  CommentCard(this.comment);
  @override 
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard>{
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
                  rowText(width, widget.comment.fullName + '\t'),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left : 24.0),
                    child: rowText(width, widget.comment.comment),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left : width * 0.45),
                    child: rowText(width, '\t' + widget.comment.date.substring(0, 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left : width * 0.45),
                    child: rowText(width, '\t' + widget.comment.date.substring(10)),
                  ),
                  
                ]
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