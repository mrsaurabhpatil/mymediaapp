import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_media_app/model/services/session_manager.dart';
import 'package:my_media_app/res/components/sized_box.dart';
import 'package:my_media_app/res/sizes.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:my_media_app/utils/routes/route_name.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((value) {
                SessionController().userId = '';
                Navigator.pushNamed(context, RouteName.splashScreen);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(tAppHeading),
            addVerticalSpace(sDefaultScreenPadding),
            Text(SessionController().userId.toString()),
          ],
        ),
      ),
    );
  }
}
