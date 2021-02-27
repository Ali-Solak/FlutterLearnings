import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/Task.dart';
import 'package:todoey/Models/TaskData.dart';

import 'TasksTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            Task task = TaskData.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkBoxState) {
                TaskData.checkOff(index);
              },
              longPressCallBack: () {
                TaskData.deleteTask(task);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}
