import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/model/Task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [];

  int get size => _tasks.length;

  Task getTask(int index){
    if(index>=0 && index<=_tasks.length){
      return _tasks[index];
    }else{
      return Task(name: "INVALID TASK",isDone: false);
    }
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  toggleDone(Task task){
    task.toggleDone();
    notifyListeners();
  }

  String remaingTasks(){
    String msg = "You have ";

    Iterable<Task> subTasks = _tasks.where((t) => !t.isDone);
    //subTasks.removeWhere((t) => t.isDone);

    if(subTasks.length==0){
      msg = "You don't have any taks today";
    }else if(subTasks.length==1){
      msg += "one task today !";
    }else{
      msg += "${subTasks.length} tasks today !";
    }

    return msg;
  }

}