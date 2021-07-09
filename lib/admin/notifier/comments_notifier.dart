import 'package:arijephyto/components/commande_model.dart';
import 'package:arijephyto/components/comment_model.dart';
import 'package:flutter/cupertino.dart';

class CommentsNotifier with ChangeNotifier {
  List<CommentModel> _commandes = [];
  CommentModel _currentCommande;

  List<CommentModel> get comments => _commandes;
  CommentModel get currentComment => _currentCommande;

  set comments(List<CommentModel> list) {
    _commandes = list;
    notifyListeners();
  }
  set currentComment(CommentModel todo) {
    _currentCommande = todo;
    notifyListeners();
  }
}