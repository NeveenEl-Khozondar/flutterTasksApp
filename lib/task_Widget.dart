import 'package:ass3/db_helper.dart';
import 'package:ass3/task_model.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  Function function;
  Function function1;
  TaskWidget(this.task, [this.function1, this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Alert"),
                        content: Text(" You Will Delete A task, are you sure?"),
                        actions: <Widget>[
                          FlatButton(child: Text("Ok"), onPressed: () {}),
                          FlatButton(child: Text("No"), onPressed: () {})
                        ],
                      );
                    });
              },
            ),
            Text(
              widget.task.taskName,
            ),
            Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) {
                  DBHelper.dbHelper.updateTask(Task(
                      widget.task.taskName,
                      this.widget.task.isComplete =
                          !this.widget.task.isComplete,
                      widget.task.id));
                  setState(() {});
                  widget.function();
                })
          ],
        ),
      ),
    );
  }
}
