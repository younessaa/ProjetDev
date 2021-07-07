import 'package:arijephyto/components/classElement.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class BlogScreen extends StatefulWidget{
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    Blog blog = ModalRoute.of(context).settings.arguments as Blog;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Scaffold(
            appBar : AppBar(
              leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColorTitle,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    )
                  ),
                  title: Text(
                  'Blog',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: kTextSize)),
                  ),
            ),

            body: Center(
                  child: ListView(
                  children: [
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                      child: Image.asset(blog.blogImage, height: 100,width: width *0.7,),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: width * 0.6,
                          child: Text(
                                blog.blogTitle,
                                style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        color: kTextColorTitle, 
                                        fontSize: kTextSizeTitle
                                        )
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
                              blog.blogTime,
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
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        blog.blogDescription,
                        style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: kTextSize)),
                      )
                    ),
                    
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              'Laissez un commentaire',
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: kTextSize)),     
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration : BoxDecoration(
                          color: Colors.grey[250],
                          border: Border.all(color: Colors.grey)
                        ),
                        child: TextFormField(
                        maxLines: 5,
                        decoration : const InputDecoration(
                          border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                SizedBox(height: 10.0),

                Padding(
                  padding: EdgeInsets.only(left: width * 0.5, right: 4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor : Color(0xFF6C8DAB),
                      enableFeedback: false,
                    ),
                    onPressed: (){
                    },
                    child: Text(
                      'Soumettre',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextSize,
                        fontWeight: FontWeight.bold
                      ),
                    ) 
                  ),
                )
                  ]
                  )
            ),
    )
    ,
  );
  }
}