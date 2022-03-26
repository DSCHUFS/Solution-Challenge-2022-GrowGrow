// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:home/MyTree/MyTree.dart';
import '../resources.dart';

class PrintImage extends StatefulWidget {
  const PrintImage({Key? key}) : super(key: key);

  @override
  _PrintImageState createState() => _PrintImageState();
}

class _PrintImageState extends State<PrintImage> {

  @override
  Widget build(BuildContext context) {
    if(imageNum >= 100)
      return Button();
    else
      return Images();
  }
}

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('images/${imageNum}%.png', width: 150);
  }
}

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      child: Text('Plant your\nown tree!', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontFamily: 'Inter-regular', fontSize: 30, fontWeight: FontWeight.bold)),
      onPressed: () {
        PlantTreeDialog();
      },
      style: ElevatedButton.styleFrom(
        primary: lightGreen,
        fixedSize: Size(250, 250),
        shape: CircleBorder(),
      ),);
  }

  void PlantTreeDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: deepGreen, width: 3)
                ),

                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('You got a tree!\nNow you can plant it in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: deepGreen, width: 3),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0)),
                          color: deepGreen),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 30.0,
                          ),
                          Text('Texas,\nUnited State',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Inter-Regular',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                actions: <Widget>[
                  Column(
                    children: [
                      GestureDetector(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            padding: EdgeInsets.all(8.0),
                            height: 100,
                            child: Center(
                              child: Text('I wanna plant it there!',
                                  style: TextStyle(
                                      fontFamily: 'Inter-Regular',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: deepGreen, width: 3),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15.0)
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyTree()));
                          },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
                        child: Text('You can only plant trees in this area until July 24, 2022.'),
                      ),
                    ],
                  ),
                ],

              ),
            ),
          );
        });
  }


}

