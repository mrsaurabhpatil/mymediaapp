import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:my_media_app/utils/utils.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(String username, String email, String password) async {
    setLoading(true);

    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Utils.toastMessage(tUserCreated);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
    /*
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          ref.child(value.user!.uid.toString()).set({
            'uid': value.user!.uid.toString(),
            'username': username,
            'email': value.user!.email.toString(),
            'phone': '',
            'profile': '',
            'onlineStatus': 'noOne',
          }).then((value) {
            setLoading(false);
          }).onError((error, stackTrace) {
            setLoading(false);
            Utils.toastMessage(error.toString());
          });
          Utils.toastMessage(tUserCreated);
          setLoading(false);
        },
      ).onError(
        (error, stackTrace) {
          setLoading(false);
          Utils.toastMessage(error.toString());
        },
      );
    } catch (e) {
      // setLoading(false);
      Utils.toastMessage(e.toString());
    }
    */
  }
}
