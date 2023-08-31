import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;
  const Logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Image(image: AssetImage('assets/chatapp.jpeg'), height: 200),
          Text(title, style: const TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}
