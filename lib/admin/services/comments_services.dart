import 'package:arijephyto/admin/notifier/comments_notifier.dart';
import 'package:arijephyto/components/commande_model.dart';
import 'package:arijephyto/components/comment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getComments(CommentsNotifier commandesNotifier, String id) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('produits').doc(id).collection('comments').get();
  List<CommentModel> commandes = [];
  snapshot.docs.forEach((doc) {
    CommentModel commande = new CommentModel(doc.id,doc.data());
    commandes.add(commande);
  });
  commandesNotifier.comments = commandes;
}

addComment(CommentsNotifier commentNotifier, String id, 
  String fullName, String date, String comment) async {
  CommentModel commandeModel = CommentModel("", {
    'fullName' : fullName,
      'comment' : comment,
      'date' : date
    
  });
  DocumentReference doc = await commandeModel.save(id);
  commandeModel.docId = doc.id;
  List commandes = commentNotifier.comments;
  commandes.add(commandeModel);
  commentNotifier.comments = commandes;
}

