import 'package:flutter/material.dart';

import '../../../res/res/sizes.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sBtnRoundHeight,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Text(title),
    );
  }
}
