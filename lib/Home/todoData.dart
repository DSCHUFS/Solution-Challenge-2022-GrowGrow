// ignore_for_file: file_names

import 'todo.dart';

class TodoData{
  List<Todo> TodoDB = [];

  int getNum(){
    return TodoDB.length;
  }

  String getContent(index){
    return TodoDB[index].todoContent;
  }

  bool? checkCampaign(index){
    TodoDB[index].isCampaign? true : false;
  }

  void addTodo(Todo todo){
    TodoDB.add(todo);
  }

  void deleteTodo(Todo todo){
    TodoDB.remove(todo);
  }
}
