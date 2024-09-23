import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final String? label;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.height,
    required this.fontSize,
    required this.backgroundColor,
    required this.textColor,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        minimumSize: Size(double.infinity, height),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: height / 3),
      ),
      onPressed: onTap,
      child: Text(
        label ?? '',
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
