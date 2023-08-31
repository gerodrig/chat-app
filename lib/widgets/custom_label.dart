import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final String? route;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const Label(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black12,
      this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushReplacementNamed(context, route!);
        }
      },
      child: Text(text,
          style: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight)),
    );
  }
}
