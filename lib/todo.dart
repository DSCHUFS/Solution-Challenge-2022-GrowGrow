class Todo{
  String todoContent = '';
  bool todoFinish = false;
  DateTime todoFinishTime = DateTime(2022,02,18,0,0,0);
  int todoPoint = 0;

  Todo(String content, bool finish, DateTime finishTime, int point){
    todoContent = content;
    todoFinish = finish;
    todoFinishTime = finishTime;
    todoPoint = point;
  }
}