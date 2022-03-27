import 'package:flutter/material.dart';
import 'package:home/main.dart';

class NewsTest extends StatelessWidget {
  NewsTest({
    Key? key,
    required this.answer,
    required this.question,
    required this.type,
    required this.getpoint,
    required this.test,
  }) : super(key: key);

  final int answer;
  final String question;
  final int type;
  final int getpoint;
  final List<dynamic> test;

  //int TestType = type;
  Widget SelectTestType(int type) {
    if (type == 1) {
      return TestOX(
        correct: this.answer,
        getpoint: this.getpoint,
      );
    } else if (type == 2) {
      return TestSelect(
        data: this.test,
        correct: this.answer,
        getpoint: this.getpoint,
      );
    } else {
      return TestError();
    }
  }

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
          'Get Point Test',
          style: TextStyle(
              color: Color(0xff615E5C),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: Text(
                  '$question',
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xff81dfa4),
                  width: 5,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: SelectTestType(type),
              margin: EdgeInsets.fromLTRB(25, 2, 25, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TestOX extends StatelessWidget {
  const TestOX({
    Key? key,
    required this.correct,
    required this.getpoint,
  }) : super(key: key);

  final int correct;
  final int getpoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 100.0,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _showDialog(context, AnswerCheck(0, correct), getpoint);
                Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp2()),);
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Color(0xff41B06B),
                  width: 5.0,
                ),
                primary: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'X',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 100.0,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _showDialog(context, AnswerCheck(1, correct), getpoint);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(
                  color: Color(0xff41B06B),
                  width: 5.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TestSelect extends StatelessWidget {
  const TestSelect(
      {Key? key,
      required this.data,
      required this.correct,
      required this.getpoint})
      : super(key: key);

  final List<dynamic> data;
  final int correct;
  final int getpoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {
                _showDialog(context, AnswerCheck(1, correct), getpoint);
              },
              child: Text(
                data[0],
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {
                _showDialog(context, AnswerCheck(2, correct), getpoint);
              },
              child: Text(
                data[1],
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {
                _showDialog(context, AnswerCheck(3, correct), getpoint);
              },
              child: Text(
                data[2],
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {
                _showDialog(context, AnswerCheck(4, correct), getpoint);
              },
              child: Text(
                data[3],
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
          ),
        ),
      ],
    );
  }
}

class TestError extends StatelessWidget {
  const TestError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.pinkAccent,
        child: Text('Error'),
      ),
    );
  }
}

//AnswerCheck(,correct)
int AnswerCheck(int Answer, int correct) {
  if (Answer == correct)
    return 1;
  else
    return 0;
}

void _showDialog(BuildContext context, int answerCheck, int Point) {
  if (answerCheck == 1) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("True"),
          content: new Text("Correct"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Get Point"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp2()),
                );
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
          Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp2()),);
        });
        // return object of type Dialog
        return AlertDialog(
          title: new Text("False"),
          content: new Text("Try Again"),
          /*
          actions: <Widget>[
            ElevatedButton(
              child: Text("Close"),
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: Color(0xff41B06B),
                  width: 3.0,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp2()),
                );
              },
            ),
          ],
          */
        );
      },
    );
  }
}
