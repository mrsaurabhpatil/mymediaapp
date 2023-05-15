import 'package:flutter/material.dart';
import 'package:my_media_app/res/strings.dart';

import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../res/components/sized_box.dart';
import '../../res/sizes.dart';
import '../../utils/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(sDefaultScreenPadding),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpace(height * 0.01),
                Text(tAppHeading,
                    style: Theme.of(context).textTheme.displaySmall),
                addVerticalSpace(height * 0.01),
                Text(
                  tAppLoginSubHeading,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                addVerticalSpace(height * 0.01),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.06, bottom: height * 0.01),
                    child: Column(
                      children: [
                        InputTextField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFilledSubmittedValue: (value) {},
                          fieldValidator: (value) {
                            return value.isEmpty ? '$tEnter $tEmail' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hint: tEmail,
                          obscureText: false,
                        ),
                        addVerticalSpace(height * 0.01),
                        InputTextField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onFilledSubmittedValue: (value) {},
                          fieldValidator: (value) {
                            return value.isEmpty ? '$tEnter $tPassword' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hint: tPassword,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    tForgotPassword,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 15.0, decoration: TextDecoration.underline),
                  ),
                ),
                addVerticalSpace(height * 0.01),
                RoundButton(
                  title: tLogin,
                  onPress: () {},
                ),
                addVerticalSpace(height * 0.02),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signupScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: tNewAccount,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 15.0),
                      children: [
                        TextSpan(
                          text: tCreateAccount,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 15.0,
                                  decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
