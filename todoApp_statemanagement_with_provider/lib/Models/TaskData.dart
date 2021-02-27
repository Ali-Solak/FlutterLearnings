import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Tomo'),
    Task(name: 'Momo'),
    Task(name: 'Lomo'),
    Task(name: 'Romo'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void checkOff(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
