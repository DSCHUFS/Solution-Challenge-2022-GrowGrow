import 'package:flutter/material.dart';
import 'resources.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
            padding: EdgeInsets.all(8.0),
            height: 200,
            //width: 400,
            decoration: BoxDecoration(
              border:
              Border.all(color: deepGreen, width: 3),
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0)
              ),
            ),
            child: ListView()
          ),
        ],
      ),
    );
  }
}