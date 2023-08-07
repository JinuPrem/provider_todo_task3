import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_task3/provider/provider_class.dart';
import 'package:provider_todo_task3/task_modelclass.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    final object = Provider.of<Provider_class>(context);
    void showalertdialog(){
      showDialog(
          context: context, builder: (context)=>AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: taskController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add aTask'
              ),
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  object.addTodo(taskController.text);
                }, child: Text('ADD'))
              ],
            )
          ],
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context, builder: (context)=>AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            title: Text('Add Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add aTask'
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      object.addTodo(taskController.text);
                    }, child: Text('ADD'))
                  ],
                )
              ],
            ),
          ));

         // showalertdialog();
        },
      child: Icon(Icons.add,
      color: Colors.white,
      ),
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: object.favoriteTask.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(object.favoriteTask[index].items),
                      trailing: Row(
                        children: [
                          Icon(Icons.check_box)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
