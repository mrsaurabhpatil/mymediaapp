import 'package:flutter/material.dart';
import 'package:my_media_app/model/services/splash_services.dart';
import 'package:my_media_app/res/fonts.dart';
import 'package:my_media_app/res/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/logo.jpg')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'by $tDeveloper',
                  style: TextStyle(
                    fontFamily: AppFonts.sfProDisplayBold,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
