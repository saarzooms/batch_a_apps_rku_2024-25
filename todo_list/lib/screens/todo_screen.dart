import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController txtTitle = TextEditingController();
  List todos = [
    {'id': 1, 'title': 'Buy books', 'isCompleted': false}
  ];
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
                      todos.add({
                        'id': DateTime.now().toIso8601String(),
                        'title': txtTitle.text,
                        'isCompleted': false
                      });
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
                  var todo = todos[index];
                  return Card(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: todo['isCompleted'],
                      onChanged: (v) {
                        todo['isCompleted'] = v;
                        setState(() {});
                      },
                      title: Text('${todo['title']} (${todo['id']})',
                          style: TextStyle(
                              decoration: todo['isCompleted']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: todo['isCompleted']
                                  ? Colors.red
                                  : Colors.black)),
                      secondary: SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                txtTitle.text = todo['title'];
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
