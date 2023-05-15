import 'package:flutter/material.dart';
import 'package:my_media_app/res/color.dart';
import 'package:my_media_app/res/sizes.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.loading = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final Color color, textColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: sBtnRoundHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(sBtnRoundRadius),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 16.0, color: textColor),
                ),
              ),
      ),
    );
  }
}
