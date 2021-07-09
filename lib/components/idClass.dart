

import 'package:flutter/cupertino.dart';

class IdNotifier with ChangeNotifier {
  String _id;
  String get currentId => _id;
  set setId (String id) {
    this._id = id;
    notifyListeners();
  } 
}