import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  late String text='';
  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();
        return Container(
          color: Color(0xFF757575),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Add Task',style: TextStyle(fontSize: 35,color: Colors.lightBlueAccent)),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextField(
                        onChanged: (value){
                          text=value;
                        },
                        controller: controller,
                        textCapitalization: TextCapitalization.sentences,
                        textAlign: TextAlign.center,
                        autofocus: true,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 30,width: double.infinity,),
                    TextButton(onPressed: (){
                      Provider.of<TaskData>(context,listen: false).addTask(Task(name: text));
                      Navigator.pop(context);
                    }, child:
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Add',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
