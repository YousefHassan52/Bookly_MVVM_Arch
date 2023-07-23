import 'package:bookly_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    this.borderRadius,
    required this.text,
    required this.backgroundColor,
    required this.textColor, this.onPressed,
  })
      : super(key: key);
  final BorderRadius? borderRadius;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius??BorderRadius.circular(15),
              )
          ),
          onPressed: onPressed,
          child: Text(
            maxLines:1,
            text,
            style: Styles.textStyle18.copyWith(color: textColor),)),
    );
  }
}
