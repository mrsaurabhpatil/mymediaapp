import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_media_app/model/services/session_manager.dart';
import 'package:my_media_app/utils/routes/route_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(const Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.dashboardScreen));
    } else {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.loginScreen));
    }
  }
}
