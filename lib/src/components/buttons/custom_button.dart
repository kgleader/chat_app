import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius = 18,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        textStyle: AppTextStyle.buttonStyle,
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      ),
      child: Text(text),
    );
  }
}
