// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:home/resources.dart';
import 'todo.dart';
import 'todoData.dart';
import 'package:home/drawer.dart';
import 'printImage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: darkGrey)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(11.0),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/account.png'),
                  ),
                  border: Border.all(color: deepGreen, width: 1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.control_point_duplicate,
                  color: Colors.black,
                  size: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '$userPoint',
                    style: TextStyle(
                      fontFamily: 'Inter-Regular',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 250.0,
            lineWidth: 10.0,
            percent: percent / 100,
            center: PrintImage(),
            progressColor: lightGreen,
            backgroundColor: Colors.transparent,
            animation: true,
            animateFromLastPercent: true,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${percent}%',
              style: TextStyle(
                fontFamily: 'Inter-Regular',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              AddTodoDialog();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.check_box, color: deepGreen, size: 25.0),
                        Text('TODO',
                            style: TextStyle(
                              fontFamily: 'Inter-Regular',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(7.0),
                    padding: const EdgeInsets.all(5),
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: deepGreen, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: todoData.getNum(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text('${todoData.getContent(index)}'),
                                  leading: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: deepGreen),
                                    child: Checkbox(
                                        checkColor: deepGreen,
                                        value: false,
                                        onChanged: (bool? value) {
                                          _deleteTodo(todoData.TodoDB[index]);
                                        }),
                                  ));
                            },
                          ),
                        ),
                        Text(
                          'Tap to add',
                          style: TextStyle(color: deepGreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void initState() {
    inputString.addListener(() {});
    super.initState();
  }

  void dispose() {
    inputString.dispose();
    super.dispose();
  }

  void makePercentAndPointCorrect() {
    if (percent > 100) percent = 100;
    if (userPoint > 200) userPoint = 200;
  }

  void _addTodo(Todo todo) {
    setState(() {
      todoData.addTodo(todo);
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      todoData.deleteTodo(todo);
      userPoint += todo.todoPoint;
      percent = userPoint / 2;
      makePercentAndPointCorrect();
      imageNum = (percent ~/ 20 + 1) * 20;
    });
  }

  void AddTodoDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: deepGreen, width: 3)),
                //Dialog Main Title
                title: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.add_box, color: deepGreen),
                  ),
                  Text("Add todo",
                      style: TextStyle(
                        fontFamily: 'Inter-Regular',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                ]),

                actions: <Widget>[
                  TextField(
                      controller: inputString,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        Todo newTodo =
                            Todo(inputString.text, false, DateTime.now(), 50);
                        _addTodo(newTodo);
                        inputString.clear();
                      },
                      showCursor: false,
                      style: TextStyle(
                          fontFamily: 'Inter-Regular',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none)
                        ),
                        filled: true,
                        fillColor: grey,
                      )
                  ),
                ],
              ),
            ),
          );
        });
  }
}
