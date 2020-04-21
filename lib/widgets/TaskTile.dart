import 'package:flutter/material.dart';
import 'package:todoey/model/Task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkCallback;
  final Function onLongPress;

  const TaskTile({
    Key key,
    @required this.task,
    @required this.checkCallback,
    @required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onLongPress: onLongPress,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.platform,
          activeColor: Colors.lightBlueAccent,
          value: task.isDone,
          onChanged: checkCallback,
          title: Text(
            "${task.name}",
            style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null),
          ),
        ),
      ),
    );
  }
}
