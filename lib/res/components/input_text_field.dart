import 'package:flutter/material.dart';
import 'package:my_media_app/res/sizes.dart';

import '../color.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onFilledSubmittedValue,
    required this.fieldValidator,
    required this.keyboardType,
    required this.hint,
    required this.obscureText,
    this.enable = true,
    this.autoFocus = false,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFilledSubmittedValue;
  final FormFieldValidator fieldValidator;

  final TextInputType keyboardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: sSecondaryScreenPadding),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: onFilledSubmittedValue,
        validator: fieldValidator,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 0, fontSize: 18.0),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(sTFFContentPadding),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryTextTextColor.withOpacity(0.8), height: 0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFieldDefaultFocus),
            borderRadius: BorderRadius.circular(sTFFOutlineInputBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(sTFFOutlineInputBorderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.alertColor),
            borderRadius: BorderRadius.circular(sTFFOutlineInputBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFieldDefaultBorderColor),
            borderRadius: BorderRadius.circular(sTFFOutlineInputBorderRadius),
          ),
        ),
      ),
    );
  }
}
