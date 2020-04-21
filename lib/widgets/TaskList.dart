import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/Task.dart';
import 'package:todoey/model/TaskData.dart';

import 'TaskTile.dart';

class TaskList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData taskData, Widget childer) {
        return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 60),
                itemCount: taskData.size,
                itemBuilder: (ctx,indx){
                  Task t = taskData.getTask(indx);
                  return TaskTile(task: t,
                    checkCallback: (value){
                      taskData.toggleDone(t);
                  }, onLongPress: (){
                    taskData.removeTask(t);
                    },);
                },
              );
      },
    );
  }
}