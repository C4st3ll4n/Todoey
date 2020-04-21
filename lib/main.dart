import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/TaskData.dart';
import 'package:todoey/screen/TaskScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
