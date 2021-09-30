import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Consumer<TaskData>(
        builder: (BuildContext context, taskData, Widget? child) {
          return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task=taskData.tasks[index];
              return
                TaskTile(
                  name: task.name,
                  checked: task.isDone,
                  callback: (boxState)
                  {
                    taskData.updateTask(task);
                  },
                  longCallback: ()
                    {
                      Provider.of<TaskData>(context,listen: false).deleteTask(taskData.tasks[index]);
                    }
                );
            },

          );
        },
      ),
    );
  }
}
