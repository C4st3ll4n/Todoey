import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {

  final Function(String) onSucess;

  const AddTask({Key key,@required this.onSucess}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "ADD TODO",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: textController,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration.collapsed(
                    hintText: "TODO Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton.icon(
                  onPressed: salvar,
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  icon: Icon(Icons.save),
                  label: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }

  void salvar() {
    if(textController.text.isNotEmpty){
      widget.onSucess(textController.text);
      Navigator.pop(context);
    }else{
      print("Hoje não");
    }
  }
}
