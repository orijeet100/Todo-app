import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool checked;
  final Function callback;
  final Function longCallback;
  TaskTile({required this.name, required this.checked, required this.callback, required this.longCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:()
      {
        longCallback();
      },
      leading: Text(name,style: TextStyle(fontSize: 20,
          decoration: checked?TextDecoration.lineThrough:null)),
      trailing: Checkbox(
        value: checked,
        onChanged: (value) {
        callback(value);
      },
      ),
    );
  }
}


