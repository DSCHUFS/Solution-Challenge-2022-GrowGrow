import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:home/Campaign/Campaign.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:home/resources.dart';
import 'todo.dart';
import 'todoData.dart';
import 'package:home/drawer.dart';
import 'printImage.dart';

class Home extends StatefulWidget {
  const Home({Key? key, Todo? passTodo}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImageProvider<Object> getimage(){
    if (Url == 'null'){
      return AssetImage('images/account.png');
    }
    else{
      return NetworkImage(Url!);
      //return AssetImage('images/account.png');
    }
  }

  Todo passTodo = Todo('', false, DateTime(2022,05,21), 0, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      drawer: drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: darkGrey,fontSize: 25)),
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
                    image: getimage(),
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
            radius: MediaQuery.of(context).size.width * 0.5,
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
            onTap: ()
            {
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
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                    decoration: BoxDecoration(
                      border:
                      Border.all(color: deepGreen, width: 3),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0)),),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: todoData.getNum(),
                        itemBuilder: (context, index){
                          return ListTile(
                              title: Text('${todoData.getContent(index)}'),
                              leading: Theme(
                                data: ThemeData(unselectedWidgetColor: deepGreen),
                                child: Checkbox(
                                    value: false,
                                    onChanged: (bool? value){
                                      _deleteTodo(todoData.TodoDB[index]);
                                    }),
                              ),
                          );
                        }
                    ),
                  ),
                  Text('Tap to add',
                    style: TextStyle(color: deepGreen),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    inputString.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    //inputString.dispose();
    super.dispose();
  }

  void makePercentAndPointCorrect() {
    if (percent > 100) percent = 100;
    if (userPoint > 200) userPoint = 200;
  }

  void _addTodo(Todo todo){
    setState(() {
      todoData.addTodo(todo);
    });
    FirebaseFirestore.instance.collection('User').doc('$Email').update({'Todos' : FieldValue.arrayUnion([todo.todoContent])});
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      todoData.deleteTodo(todo);
      userPoint += todo.todoPoint;
      percent = userPoint / 2;
      makePercentAndPointCorrect();
      imageNum = (percent ~/ 20 + 1) * 20;
    });
    FirebaseFirestore.instance.collection('User').doc('$Email').update({'Todos' : FieldValue.arrayRemove([todo.todoContent])});
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
                title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                            Icons.add_box,
                            color: deepGreen),
                      ),
                      Text("Add todo", style: TextStyle(
                        fontFamily: 'Inter-Regular',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                    ]
                ),
                actions: <Widget>[
                  TextField(
                      controller: inputString,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        Todo newTodo =
                        Todo(inputString.text, false, DateTime.now(), 50, false);
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