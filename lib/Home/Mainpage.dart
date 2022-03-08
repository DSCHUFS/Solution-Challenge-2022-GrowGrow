// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:home/Home/resources.dart';
import 'TodoListWidget.dart';
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
        leading: Builder(builder: (context){
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
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.control_point_duplicate,
                  color: Colors.black,
                  size: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$userPoint',
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
            percent: percent/100,
            center: PrintImage(),
            progressColor: lightGreen,
            backgroundColor: Colors.transparent,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('${percent}%',
                style: TextStyle(
                  fontFamily: 'Inter-Regular',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
    ),

          GestureDetector(
            onTap: ()
            {
              AddTodoDialog();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                            Icons.check_box,
                            color: deepGreen,
                            size: 25.0
                        ),
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
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(color: deepGreen, width: 3),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0)),),
                            child: TodoList(),
                            )
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

  void dispose(){
    inputString.dispose();
    super.dispose();
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
                    side: BorderSide(color: deepGreen, width: 3)
                ),
                //Dialog Main Title
                title: Text("TODO", style: TextStyle(
                  fontFamily: 'Inter-Regular',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),

                content: Container(
                    width: double.minPositive,
                    child: TodoList()),

                actions: <Widget>[
                  TextField(
                    controller: inputString,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      Todo newTodo = Todo(inputString.text, false, DateTime(0,0,0,0,0), 2);
                      oneTodo = newTodo.todoContent;
                      todoData.addTodo(newTodo);
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
                      hintText: 'Add a task...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter-Regular',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
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
