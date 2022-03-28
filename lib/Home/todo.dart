class Todo{
  String todoContent = '';
  bool todoFinish = false;
  DateTime todoFinishTime = DateTime(2022,02,18,0,0,0);
  int todoPoint = 0;
  bool isCampaign = false;

  Todo(this.todoContent, this.todoFinish, this.todoFinishTime, this.todoPoint, this.isCampaign);
}
