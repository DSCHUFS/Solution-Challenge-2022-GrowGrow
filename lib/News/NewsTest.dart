import 'package:flutter/material.dart';

class NewsTest extends StatelessWidget {
  NewsTest({
    Key? key,
    required this.answer,
    required this.question,
    required this.type,
    required this.getpoint,
  }) : super(key: key);

  final int answer;
  final String question;
  final int type;
  final int getpoint;

  //int TestType = type;
  Widget SelectTestType(int type) {
    if (type == 1) {
      return TestOX();
    } else if (type == 2) {
      return TestSelect();
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
  const TestOX({Key? key}) : super(key: key);

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
              onPressed: () {},
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
              onPressed: () {},
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
  const TestSelect({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                '1',
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
              onPressed: () {},
              child: Text(
                '2',
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
              onPressed: () {},
              child: Text(
                '3',
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
              onPressed: () {},
              child: Text(
                '4',
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
