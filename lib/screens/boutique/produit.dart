import 'package:arijephyto/admin/notifier/comments_notifier.dart';
import 'package:arijephyto/admin/notifier/user_notifier.dart';
import 'package:arijephyto/admin/services/comments_services.dart';
import 'package:arijephyto/admin/services/user_service.dart';
import 'package:arijephyto/components/comment_model.dart';
import 'package:arijephyto/components/idClass.dart';
import 'package:arijephyto/components/logicFunctions.dart';
import 'package:arijephyto/components/produit_model.dart';
import 'package:arijephyto/models/cardComment.dart';
import 'package:arijephyto/models/listsOffresPorts.dart';
import 'package:arijephyto/screens/panier/panier.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';


class ProduitItem extends StatefulWidget {
  @override
  _ProduitItemState createState() => _ProduitItemState();
}

class _ProduitItemState extends State<ProduitItem> {
  double _rating;
  double _initialRating = 0.0;
  TextEditingController comment = TextEditingController();

  Column commentsUsers(List<CommentModel> list){
    List<CommentCard> commets = [];
    for (var item in list) {
      commets.add(CommentCard(item));
    }
     return Column(
         children : commets
       );
  }

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }
  @override
  Widget build(BuildContext context) {
    
    ProduitModel prod = ModalRoute.of(context).settings.arguments as ProduitModel;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    UsersNotifier userNotifier = Provider.of<UsersNotifier>(context);
    IdNotifier idNotifier = Provider.of<IdNotifier>(context);
    getUser(userNotifier, idNotifier.currentId);

    CommentsNotifier commentsNotifier = Provider.of<CommentsNotifier>(context);
    getComments(commentsNotifier, prod.docId);
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Center(
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.arrowLeft, color: kTextColorTitle,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    )
                  ),
                  title: Text(
                  prod.titre,
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorTitle, fontSize: kTextSize)),
                  ),
            ),

            body: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200].withOpacity(0.9),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageTitle(prod, width),
            
                          prixNombre(height, width, prod, Colors.green[100])
                        ],
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          prod.text,
                          style : GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColorS, fontSize: 14)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ajouteButton(width, prod, context),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                
                ListOffres([prod.imageUrl], Colors.greenAccent),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    prod.descirption,
                    style : GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextColorB, fontSize: 14)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Avis : ',
                    style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 30)),
                  ),
                ),
                Container(
                  child: commentsNotifier.comments.isEmpty ? null : commentsUsers(commentsNotifier.comments)
                ),
                Container(
                  child: commentsNotifier.comments.isEmpty ? Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Il n’y pas encore d’avis.\nSoyez le premier à laisser votre avis sur “' + prod.titre+'”',
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFF444444), fontSize: 18)),
                    ),
                  ) : null,
                ),
            
                SizedBox(height: 40.0),
                Center(
                  child: Text(
                    'Votre vote',
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22)),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(child: _ratingBar()),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    '$_rating',
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF444444), fontSize: 22)),
                  ),
                ),
                SizedBox(height: 20.0),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Votre avis',
                          style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: kTextSize)),
                        ),
                        TextSpan(
                          text: ' *',
                          style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: kTextSize)),
                        ),
                      ],
                    ),
                  ),
                ),
            
                inputField('Commenter ici ', comment),
            
                SizedBox(height: 10.0),
            
                Padding(
                  padding: EdgeInsets.only(left: width * 0.5, right: 4),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor : Color(0xFF6C8DAB),
                      enableFeedback: false,
                    ),
                    onPressed: () async {
                      if(comment.text != null){
                        try{
                          await addComment(commentsNotifier,prod.docId, userNotifier.currentUser.getPrenom + " " + userNotifier.currentUser.getNom, DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()), comment.text);
                          comment.clear();
                          print('Comment Added Succesful');
                          setState(() {
                            
                          });
                        }catch(e){
                          print('Comment not Added !!!');
                        }
                      }
                      
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
                ),
                SizedBox(height: 850.0),
              ],
              )
    )
    ,
  );
  }

  Container ajouteButton(double width, ProduitModel prod, BuildContext context) {
    return Container(
                      height: 50,
                      width: width * 0.75,
                      child: MaterialButton(
                            child: Text('AJOUTER AU PANIER',
                                    style: GoogleFonts.ruda(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                                  ),
                            onPressed: () {
                              setState(() {
                                if(getProduit(Panier.listProduitsPanier, prod.docId) == null)
                                  Panier.listProduitsPanier.insert(0, prod);
                                else
                                  Panier.listProduitsPanier.elementAt(Panier.listProduitsPanier.indexOf(getProduit(Panier.listProduitsPanier, prod.docId))).nbrDemande = prod.nbrDemande;
                                Panier.somme = calculeSommePanier(Panier.listProduitsPanier);
                              });
                              Navigator.pushNamed(context, '/panier');
                            },
                            color: Color(0xFF6C8DAB),
                            ),
                    );
  }

  Column prixNombre(double height, double width, ProduitModel prod, Color color) {
    return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                          height: height * 0.11,
                          width: width * 0.4,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                                prod.prix.toString()+'0 Dh',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      color: Colors.black87, 
                                      fontSize: kTextSizeTitle
                                  )
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: height * 0.11,
                          width: width * 0.4,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                      onTap: () {
                                          if(prod.nbrDemande> 1){
                                            setState(() {
                                            prod.nbrDemande--;
                                            });
                                          }
                                      },
                                      child: Container(
                                        height: width * 0.1,
                                        width: width * 0.1,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '-',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold, 
                                                  color: kTextColor, 
                                                  fontSize: 30
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      prod.nbrDemande.toString(),
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold, 
                                            color: Colors.black87, 
                                            fontSize: 26
                                        )
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                            prod.nbrDemande++;
                                            });
                                      },
                                      child: Container(
                                        height: width * 0.1,
                                        width: width * 0.1,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '+',
                                            style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold, 
                                                  color: kTextColor, 
                                                  fontSize: 30
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                          ],
                        );
  }

  Column imageTitle(ProduitModel prod, double width) {
    return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 20,),
                              ClipRRect(
                              borderRadius: BorderRadius.circular(kDefaultRadius),
                              child: Image.network(prod.imageUrl, width : width * 0.35),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width : width * 0.3,
                              child : Text(
                                prod.titre,
                                style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        color: kTextColorTitle, 
                                        fontSize: kTextSizeTitle
                                        )
                                      ),
                              ),
                            ),
                            
                            SizedBox(height: 20,),
                            ],
                          );
  }

  Widget _ratingBar() {
    return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 40.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
  }

  Widget inputField(String hintText, TextEditingController controller,
      {bool isObscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        obscureText: isObscureText,
        controller: controller,
        decoration: InputDecoration(hintText: hintText, border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      ),
    );
  }

}