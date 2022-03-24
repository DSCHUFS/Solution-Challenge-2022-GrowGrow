import 'package:flutter/material.dart';

class MyTreeContainer extends StatefulWidget {
  const MyTreeContainer({
    Key? key,
    required this.usernum,
    required this.location,
    required this.date,
    required this.imagenum

  }) : super(key: key);

  final String usernum;
  final String location;
  final String date;
  final int imagenum;

  @override
  State<MyTreeContainer> createState() => _MyTreeContainerState();
}

class _MyTreeContainerState extends State<MyTreeContainer> {
  @override
  Widget build(BuildContext context) {
    String usernum = widget.usernum;
    String location = widget.location;
    String date = widget.date;
    int imagenum = widget.imagenum;

    return Container(
      child : Row(
        children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15,8,15,8),
              child: plant(imagenum),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [
                Text('$location', style : TextStyle(color: Colors.black, fontSize : 20,
                ),textAlign : TextAlign.center,),
                Text('$date', style : TextStyle(color : Colors.black, fontSize : 15,
                ), ),
              ],
          ),
        ],
      ),
    );
  }
}

Image plant(int leading){
  if (leading == 0) {
    return Image.asset('images/100%.png',width : 55, height: 55);
  } else {
    return Image.asset('images/40%.png', width : 55, height : 55);
  }
}
