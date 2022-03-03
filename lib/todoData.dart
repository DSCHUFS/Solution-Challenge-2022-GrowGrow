// ignore_for_file: file_names

import 'todo.dart';

class TodoData{
  List<Todo> TodoDB = [];

  int getNum(){
    return TodoDB.length;
  }

  String getContent(int index){
    return TodoDB[index].todoContent;
  }

  bool getFinish(int index){
    return TodoDB[index].todoFinish;
  }

  DateTime getFinishTime(int index){
    return TodoDB[index].todoFinishTime;
  }

  int getPoint(int index) {
    return TodoDB[index].todoPoint;
  }

  void addTodo(Todo todo){
    TodoDB.add(todo);
  }

  void deleteTodo(int index){
    TodoDB.removeAt(index);
  }
}