import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list/services/api_call.dart';

import '../models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String selId = "";
  TextEditingController txtTitle = TextEditingController();
  List<Todo> todos = [
    // {'id': 1, 'title': 'Buy books', 'isCompleted': false}
  ];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    todos = APICall.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtTitle,
                      decoration: InputDecoration(
                        hintText: 'Enter your task',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //to add or update logic into list
                    if (txtTitle.text.isNotEmpty) {
                      if (selId == "") {
                        // todos.add({
                        //   'id': DateTime.now().toIso8601String(),
                        //   'title': txtTitle.text,
                        //   'isCompleted': false
                        // });
                      } else {
                        //update operation
                        int index = todos.indexWhere((element) =>
                            element.id.toString() == selId.toString());
                        log(selId + " " + index.toString());
                        var todo = todos[index];
                        todo.task = txtTitle.text;
                        todos.removeAt(index);
                        todos.insert(index, todo);
                        selId = "";
                      }

                      //clear textfield
                      txtTitle.clear();
                      setState(() {});
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  Todo todo = todos[index];
                  return Card(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: todo.completed,
                      onChanged: (v) {
                        todo.completed = v;
                        setState(() {});
                      },
                      title: Text('${todo.task} (${todo.id})',
                          style: TextStyle(
                              decoration: todo.completed!
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color:
                                  todo.completed! ? Colors.red : Colors.black)),
                      secondary: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                txtTitle.text = todo.task!;
                                selId = todo.id.toString();
                                log(selId);
                                setState(() {});
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                //logic to delete the task
                                todos.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
