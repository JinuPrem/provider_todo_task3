import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_todo_task3/task_modelclass.dart';

class Provider_class extends ChangeNotifier{

  List <TaskModelClass>_favTask=[];

  UnmodifiableListView <TaskModelClass>get favoriteTask=>UnmodifiableListView(_favTask);


  void addTodo (String items){
    final favTaskList = _favTask.contains(items);
 _favTask.add(TaskModelClass(items: items,isCompleted: false));
    notifyListeners();

  }

  void removeToDo(String items){
    final favTaskList=_favTask.contains(items);
    _favTask.remove(TaskModelClass(items: items, isCompleted: false));
  }

}