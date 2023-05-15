import 'package:flutter/material.dart';
import 'package:my_media_app/model/signup/signup_controller.dart';
import 'package:my_media_app/res/components/input_text_field.dart';
import 'package:my_media_app/res/components/round_button.dart';
import 'package:my_media_app/res/components/sized_box.dart';
import 'package:my_media_app/res/sizes.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:my_media_app/utils/routes/route_name.dart';
import 'package:my_media_app/utils/utils.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
          child: ChangeNotifierProvider(
            create: (_) => SignUpController(),
            child: Consumer<SignUpController>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      addVerticalSpace(height * 0.01),
                      Text(tAppHeading,
                          style: Theme.of(context).textTheme.displaySmall),
                      addVerticalSpace(height * 0.01),
                      Text(
                        tAppSignUpSubHeading,
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
                                  Utils.fieldFocus(context, usernameFocusNode,
                                      emailFocusNode);
                                },
                                fieldValidator: (value) {
                                  return value.isEmpty
                                      ? '$tEnter $tUsername'
                                      : null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                hint: tUsername,
                                obscureText: false,
                              ),
                              addVerticalSpace(height * 0.01),
                              InputTextField(
                                controller: emailController,
                                focusNode: emailFocusNode,
                                onFilledSubmittedValue: (value) {
                                  Utils.fieldFocus(context, emailFocusNode,
                                      passwordFocusNode);
                                },
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
                                  return value.isEmpty
                                      ? '$tEnter $tPassword'
                                      : null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                hint: tPassword,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(height * 0.01),
                      RoundButton(
                        title: tSignUp,
                        loading: false,
                        onPress: () {
                          print('Signup clicked');
                          if (_formKey.currentState!.validate()) {
                            provider.signUp(usernameController.text,
                                emailController.text, passwordController.text);
                          }
                        },
                      ),
                      addVerticalSpace(height * 0.02),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.loginScreen);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: tExistingAccount,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 15.0),
                            children: [
                              TextSpan(
                                text: tLogin,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
