import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'Add_task.dart';
import 'package:todoey_flutter/widgets/Task_list.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: CircleAvatar(child: Icon(Icons.add,color: Colors.white,size: 25,),backgroundColor: Colors.lightBlueAccent,radius: 30,),
            onPressed: (){
              showModalBottomSheet(isScrollControlled: true,
                  context: context, builder: (context) =>Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                child: AddTask(),
              ),
                  ));
            },
          ),
          body: SafeArea(
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.90,0),
                      child: IconButton(
                        tooltip: 'Long Press on a task to delete',
                          onPressed: (){
                            Alert(
                              context: context,
                              type: AlertType.info,
                              title: "Help",
                              desc: "Tap on the floating + button to add task and long press on a task to delete it !",
                            ).show();
                          }, icon: Icon(Icons.help,size: 30,color: Colors.white,))),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top:0,bottom: 25),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.list,size: 40,),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(width: double.infinity,height: 10),
                          Text('Todoey',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(width: double.infinity,height: 10),
                          Text(' ${Provider.of<TaskData>(context).tasks.length} Tasks',
                            style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 25,
                            ),)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TaskList(),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}





