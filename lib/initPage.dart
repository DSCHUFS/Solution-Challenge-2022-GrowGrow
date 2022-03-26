import 'package:flutter/material.dart';

class Init extends StatelessWidget {
  const Init({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset('images/icon.png'),
      ),
    );
  }
}
