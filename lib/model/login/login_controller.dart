import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_media_app/model/services/session_manager.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:my_media_app/utils/routes/route_name.dart';
import 'package:my_media_app/utils/utils.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        setLoading(false);
        Navigator.pushNamed(context, RouteName.dashboardScreen);
      }).onError(
        (error, stackTrace) {
          setLoading(false);
          Utils.toastMessage(error.toString());
          Utils.toastMessage(tUserPasswordToast);
        },
      );
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
