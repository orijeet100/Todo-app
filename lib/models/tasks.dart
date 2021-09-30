import 'package:flutter/cupertino.dart';
class Task
{
  late final String name;
  late bool isDone;
  Task({required this.name,this.isDone=false});

  toggleDone()
  {
    isDone=!isDone;
  }

}


class TaskData extends ChangeNotifier
{
  List<Task> tasks=[

  ];

  void addTask(Task newTask)
  {
    tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task)
  {
    tasks.remove(task);
    notifyListeners();
  }

}