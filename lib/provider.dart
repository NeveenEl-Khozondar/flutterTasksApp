import 'package:flutter/cupertino.dart';
import 'package:ass3/db_helper.dart';
import 'db_helper.dart';
import 'task_model.dart';

class Provider extends ChangeNotifier {
  List<Task> _tasks = new List();
  List<Task> _tasksGet = new List();

  static of(BuildContext context, {bool listen}) {}
}

getTaskWidgets(Future<List<Map>> tasks, Function fun) {
  tasks.then((value) {
    value.forEach((element) {
      this._tasksGet.add(Task(element[DBHelper.taskNameColumnName],
          element[DBHelper.taskIsCompleteColumnName] == 1 ? true : false));
    });

    fun();
  });
  return this._tasksGet;
}

deleteTask(Task task) {
  this._tasks.remove(task);
  notifyListeners();
}
