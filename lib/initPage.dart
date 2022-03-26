import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/login.dart';
import 'package:home/main.dart';
import 'package:home/resources.dart';

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);

  @override
  State<Init> createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeTest(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff8AB39D),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0, bottom: 10),
              child: Image(
                image: AssetImage('images/Icon.png'),
                width: 112,
                height: 112,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Grow',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
            )
          ],
        )),
      ),
    );
  }
}
