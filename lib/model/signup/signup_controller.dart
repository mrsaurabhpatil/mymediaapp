import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_media_app/model/services/session_manager.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:my_media_app/utils/routes/route_name.dart';
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

  void signUp(BuildContext context, String username, String email,
      String password) async {
    setLoading(true);
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          SessionController().userId = value.user!.uid.toString();
          ref.child(value.user!.uid.toString()).set({
            'uid': value.user!.uid.toString(),
            'username': username,
            'email': value.user!.email.toString(),
            'password': password,
            'phone': '',
            'profile': '',
            'onlineStatus': 'noOne',
          }).then((value) {
            setLoading(false);
            Navigator.pushNamed(context, RouteName.dashboardScreen);
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
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
