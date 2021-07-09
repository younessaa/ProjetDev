import 'package:arijephyto/components/classElement.dart';
import 'package:flutter/cupertino.dart';

class UsersNotifier with ChangeNotifier {

  Person _currentUser;

  Person get currentUser => _currentUser;

  set currentUser(Person todo) {
    _currentUser = todo;
    notifyListeners();
  }
}