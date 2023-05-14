import 'package:flutter/material.dart';

import '../../res/components/input_text_field.dart';
import '../../res/components/round_button.dart';
import '../../res/components/sized_box.dart';
import '../../res/sizes.dart';
import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey();
  final usernameController = TextEditingController();
  final usernameFocusNode = FocusNode();
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
                Text('Welcome to the JungleBeat',
                    style: Theme.of(context).textTheme.displaySmall),
                addVerticalSpace(height * 0.01),
                Text(
                  'Enter your email address\nto register your account',
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
                          controller: usernameController,
                          focusNode: usernameFocusNode,
                          onFilledSubmittedValue: (value) {
                            Utils.fieldFocus(
                                context, usernameFocusNode, emailFocusNode);
                          },
                          fieldValidator: (value) {
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hint: 'Username',
                          obscureText: false,
                        ),
                        addVerticalSpace(height * 0.01),
                        InputTextField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          onFilledSubmittedValue: (value) {
                            Utils.fieldFocus(
                                context, emailFocusNode, passwordFocusNode);
                          },
                          fieldValidator: (value) {
                            return value.isEmpty ? 'Enter Email' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hint: 'Email',
                          obscureText: false,
                        ),
                        addVerticalSpace(height * 0.01),
                        InputTextField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          onFilledSubmittedValue: (value) {},
                          fieldValidator: (value) {
                            return value.isEmpty ? 'Password' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hint: 'Password',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(height * 0.01),
                RoundButton(
                  title: 'Signup',
                  onPress: () {},
                ),
                addVerticalSpace(height * 0.02),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 15.0),
                      children: [
                        TextSpan(
                          text: 'Login',
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
