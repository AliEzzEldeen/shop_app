// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.white,
    this.bgColor, required this.sizeFont,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final double sizeFont;

  @override
  Widget build(BuildContext context) {
    borderRadius ??= BorderRadius.circular(20.sp);
    margin ??= EdgeInsets.symmetric(horizontal: 20.sp);
    padding ??= EdgeInsets.symmetric(vertical: 10.sp);

    return SizedBox(
      width: double.infinity,
      height: 6.3.h,
      child: Container(
        margin: margin,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(bgColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius!,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: padding!,
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: sizeFont,
              ),
            ),
          ),
        ),
      ),
    );
  }
}