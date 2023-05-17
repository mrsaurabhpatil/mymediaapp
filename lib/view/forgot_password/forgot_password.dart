import 'package:flutter/material.dart';
import 'package:my_media_app/model/forgot_password/forgot_password_controller.dart';
import 'package:my_media_app/res/components/input_text_field.dart';
import 'package:my_media_app/res/components/round_button.dart';
import 'package:my_media_app/res/components/sized_box.dart';
import 'package:my_media_app/res/sizes.dart';
import 'package:my_media_app/res/strings.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(elevation: 0),
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
                Text(tForgotPassword,
                    style: Theme.of(context).textTheme.displaySmall),
                addVerticalSpace(height * 0.01),
                Text(
                  tAppForgotPasswordSubHeading,
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
                      ],
                    ),
                  ),
                ),
                addVerticalSpace(height * 0.01),
                ChangeNotifierProvider(
                  create: (_) => ForgotPasswordController(),
                  child: Consumer<ForgotPasswordController>(
                    builder: (context, provider, child) {
                      return RoundButton(
                        title: tForgotPasswordBtn,
                        loading: provider.loading,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            provider.forgotPassword(
                                context, emailController.text);
                          }
                        },
                      );
                    },
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
