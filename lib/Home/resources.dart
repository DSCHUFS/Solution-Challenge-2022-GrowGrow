import 'package:flutter/material.dart';
import 'todoData.dart';

//Colors
const lightGreen = Color(0xFF81dfa4);
const deepGreen = Color(0xFF41B06B);
const lightGrey = Color(0xFFEFEFEF);
const grey = Color(0xFFC4C4C4);
const darkGrey = Color(0xFF615E5C);


TodoData todoData = TodoData();
int userPoint = 0;
late num percent = userPoint / 2;
late int imageNum = (percent ~/ 20 + 1) * 20;
TextEditingController inputString = TextEditingController();