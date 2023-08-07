class TaskModelClass{
  String items;
  bool isCompleted;

  TaskModelClass({required this.items,required this.isCompleted});
  void complete(){
    isCompleted=!isCompleted;
  }
}