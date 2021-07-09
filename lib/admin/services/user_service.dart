import 'package:arijephyto/admin/notifier/user_notifier.dart';
import 'package:arijephyto/components/classElement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getUser(UsersNotifier userNotifier, String id) async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').get();
      Person user;
  snapshot.docs.forEach((doc) {
    print(doc.data());
    if(doc.data()['_idAuth'] == id){
      print('Find !!!!!!!!!!!!!');
      print(doc.data());
      user = new Person(doc.id,doc.data());
    }
  });
  userNotifier.currentUser = user;
}

addUser(UsersNotifier usersNotifier, String _idAuth,
  String _prenom ,String _nom,
  String _adresse ,String _ville, String _region,String _codePostale, String _pays,
  String _telephone, String _email) async {
  Person userModel = Person("", {
    '_idAuth' : _idAuth,
      '_prenom' : _prenom,
      '_nom' : _nom,
      '_adresse' : _adresse,
      '_ville' : _ville,
      '_region' : _region,
      '_codePostale' : _codePostale,
      '_pays' : _pays,
      '_telephone' : _telephone,
      '_email' : _email
  });
  DocumentReference doc = await userModel.save();
  userModel.docId = doc.id;
  usersNotifier.currentUser = userModel;
}
