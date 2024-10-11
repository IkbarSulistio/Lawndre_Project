import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Change this to accept null
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color.fromRGBO(55, 94, 97, 1),
    this.textColor = Colors.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // This will allow it to be null
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        minimumSize: Size(double.infinity, 50), // Ensure it takes full width
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(width: 8),
          ],
          Text(text),
        ],
      ),
    );
  }
}
