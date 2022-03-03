import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home/NewsTest.dart';

class NewsReport extends StatelessWidget {
  const NewsReport({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final DateTime time;
  final String writer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Color(0xff615E5C),
        ),
        title: Text(
          'News',
          style: TextStyle(
              color: Color(0xff615E5C),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Color(0xff81dfa4),
              width: 3,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 70,
                color: Color(0xff41B06B),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$subtitle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$writer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              DateFormat("yyyy-MM-dd").format(time),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.pinkAccent,
                    child: ListView(
                      children: <Widget>[
                        Text('기사'),
                        Text('사진'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsTest()),
                    );
                  },
                  child: Text(
                    'asd',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      color: Color(0xff41B06B),
                      width: 5.0,
                    ),
                    alignment: Alignment.centerLeft,
                    primary: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
