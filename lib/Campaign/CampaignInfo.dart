
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home/resources.dart';
import 'package:home/Home/todoData.dart';
import 'package:home/Home/todo.dart';

class CampaignInfo extends StatelessWidget {
  const CampaignInfo({
    Key? key,
    required this.campaigntitle,
    required this.like,
    required this.scrap,
    required this.info,
    required this.campaigndate,
    required this.cpimage,
    required this.todo,
  }) : super(key: key);

  final String campaigntitle;
  final int like;
  final int scrap;
  final String info;
  final String campaigndate;
  final String cpimage;
  final String todo;

  ImageProvider<Object> imagecheck() {
    if (cpimage == 'null')
      return AssetImage('images/grandcanyon.jpg');
    else
      return NetworkImage(cpimage);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Color(0xff615E5C),
          ),
          title: const Text(
            'Campaign',
            style: TextStyle(
                color: Color(0xff615E5C),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: deepGreen,
                width: 3,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text(
                    campaigntitle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text(
                    campaigndate,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 260,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imagecheck(),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            'Info.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            info,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: Color(0xff41B06B),
                        width: 3.0,
                      ),
                      alignment: Alignment.centerLeft,
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      FirebaseFirestore.instance.collection('User').doc('$Email').update({'Todos' : FieldValue.arrayUnion([this.todo])});
                      todoData.addTodo(Todo(this.todo, false, DateTime(2022,5,10), 50, true));
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: deepGreen, width: 3)
                                ),
                                title: Column(
                                  children: <Widget>[
                                    Text("A todo of the campaign is added!"),
                                  ],
                                ),
                                actions: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: deepGreen
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Participate',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }


}

