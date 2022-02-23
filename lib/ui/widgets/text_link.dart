import 'package:flutter/material.dart';

class TextLink extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const TextLink(this.text, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
          color: Color(0xffB4A101),
        ),
      ),
    );
  }
}
