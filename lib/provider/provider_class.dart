import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider_todo_task3/task_modelclass.dart';

class Provider_class extends ChangeNotifier{

  List <TaskModelClass>_favTask=[];

  UnmodifiableListView <TaskModelClass>get favoriteTask=>UnmodifiableListView(_favTask);


  void addTodo (String items){
    // final favTaskList = _favTask.contains(items);
 _favTask.add(TaskModelClass(items: items,isCompleted: false));
    notifyListeners();

  }

  void removeToDo(TaskModelClass items){
    // final favTaskList=_favTask.contains(items);
    _favTask.remove(items);
    notifyListeners();

  }

  void checkComplete(TaskModelClass items){
    final itemindex=_favTask.indexOf(items);
    _favTask[itemindex].complete();
    notifyListeners();

  }

}