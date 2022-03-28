import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home/News/NewsReport.dart';
import 'package:home/News/NewsTest.dart';
import 'package:home/News/NewsData.dart';
import 'package:home/main.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({
    Key? key,
    required this.index,
    required this.title,
    required this.writer,
    required this.tag1,
    required this.tag2,
    required this.report,
    required this.answer,
    required this.question,
    required this.type,
    required this.getpoint,
    required this.image,
    required this.DateString,
    required this.test,
  }) : super(key: key);

  final int index;
  final String title;
  final String writer;
  final String tag1;
  final String tag2;
  final String report;
  final String image;
  final String DateString;

  final int answer;
  final String question;
  final int type;
  final int getpoint;
  final List<dynamic> test;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  ImageProvider<Object> imagecheck(){
    if (widget.image == 'null')
      return  AssetImage('images/tree.png');
    else
      return NetworkImage(widget.image);
  }
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    String writer = widget.writer;
    DateTime time = newsData.getTime(widget.index);
    String tag1 = widget.tag1;
    String tag2 = widget.tag2;
    String image = widget.image;
    String DateString = widget.DateString;
    //QA
    String report = widget.report;
    int answer = widget.answer;
    String question = widget.question;
    int type = widget.type;
    int getpoint = widget.getpoint;
    List<dynamic> test = widget.test;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Color(0xff41B06B),
            width: 3,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsReport(
                        title: title,
                        time: DateString,
                        writer: writer,
                        report: report,
                        answer: answer,
                        question: question,
                        type: type,
                        getpoint: getpoint,
                        image: image,
                        test: test,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: imagecheck(),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Positioned(
                      top: 130,
                      child: Container(
                        height: 85,
                        width: 1000,
                        color: Colors.black45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 3),
                              child: Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        //DateFormat("yyyy-MM-dd").format(time),
                                        (DateString),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      writer,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                width: 1000,
                child: Divider(
                  color: Color(0xff41B06B),
                  thickness: 2.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(tag1),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xff81dfa4),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(tag2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xff81dfa4),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
