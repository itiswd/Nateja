import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String text;
  final double size;
  final String font;
  final FontWeight weight;
  const MainText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    required this.font,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: Colors.black,
        fontWeight: weight,
        fontFamily: font,
      ),
    );
  }
}
