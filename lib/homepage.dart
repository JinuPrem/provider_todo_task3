import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_task3/provider/provider_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          'Groceries',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text('Add Task'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: taskController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Add aTask'),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (taskController.text == '') {
                                    final snackBar = SnackBar(
                                      content: const Text('Enter a text'),
                                      action: SnackBarAction(
                                          label: 'Dismiss', onPressed: () {}),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    object.addTodo(taskController.text);
                                    Navigator.of(context).pop();
                                    taskController.clear();
                                  }
                                },
                                child: const Text('ADD'))
                          ],
                        )
                      ],
                    ),
                  ));
        },
        backgroundColor: Colors.black54,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Text(
            'Items:${object.favoriteTask.length}',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: object.favoriteTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(object.favoriteTask[index].items),
                    trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            Checkbox(
                              value: object.favoriteTask[index].isCompleted,
                              onChanged: (_) {
                                object
                                    .checkComplete(object.favoriteTask[index]);
                              },
                            ),
                            IconButton(
                                onPressed: () {
                                  object.removeToDo(object.favoriteTask[index]);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ))
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
