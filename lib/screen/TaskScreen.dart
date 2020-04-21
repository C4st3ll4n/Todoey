import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/Task.dart';
import 'package:todoey/model/TaskData.dart';
import 'package:todoey/screen/AddTaskScreen.dart';
import 'package:todoey/widgets/TaskList.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (contexto) => AddTask(
                      onSucess: (String a) {
                          Provider.of<TaskData>(context).addTask(Task(name: a,isDone: false));
                      },
                    ));
          },
          label: Text("Add todo"),
          icon: Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).remaingTasks()}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                height: 400,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: TaskList(),
              ),
            )
          ],
        ));
  }
}
