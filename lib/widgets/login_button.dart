import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color buttonColor;
  final Function? onPressed;
  final String text;
  final bool isDisabled;
  final Color textColor;
  const LoginButton(
      {super.key,
      this.buttonColor = Colors.blue,
      this.onPressed,
      required this.text,
      this.isDisabled = false,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: isDisabled ? Colors.grey : buttonColor,
      onPressed: isDisabled ? null : () => onPressed!(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
