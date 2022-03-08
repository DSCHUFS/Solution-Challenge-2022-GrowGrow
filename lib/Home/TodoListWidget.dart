import 'package:flutter/material.dart';
import 'package:home/Home/resources.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Text('Test'),
          );
        },
      itemCount: 1,
    );
  }
}