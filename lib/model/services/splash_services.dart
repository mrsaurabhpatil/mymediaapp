import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_media_app/utils/routes/route_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.loginScreen));
  }
}
