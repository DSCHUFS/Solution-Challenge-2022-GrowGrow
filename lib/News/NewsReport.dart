import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home/News/NewsTest.dart';

class NewsReport extends StatelessWidget {
  const NewsReport({
    Key? key,
    required this.title,
    required this.time,
    required this.writer,
    required this.report,
    required this.answer,
    required this.question,
    required this.type,
    required this.getpoint,
    required this.image,
    required this.test,
  }) : super(key: key);

  final String title;
  final String time;
  final String writer;
  final String report;
  final String image;

  final int answer;
  final String question;
  final int type;
  final int getpoint;
  final List<dynamic> test;

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
              color: Color(0xff81dfa4),
              width: 3,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                //height: 100,
                color: Color(0xff41B06B),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
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
                              (time),
                              //DateFormat("yyyy-MM-dd").format(time),
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
                    color: Colors.white,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(image),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(report),
                        ),
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
                      MaterialPageRoute(
                          builder: (context) => NewsTest(
                                getpoint: getpoint,
                                answer: answer,
                                question: question,
                                type: type,
                                test: test,
                              )),
                    );
                  },
                  child: Text(
                    'News Quiz',
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
