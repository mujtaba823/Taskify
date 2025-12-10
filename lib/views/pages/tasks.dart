import 'package:flutter/material.dart';
import 'package:todoapp/data/boxes.dart';
import 'package:todoapp/views/todo.dart';
import 'package:todoapp/widgets/todo_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

final _formGlobalKey = GlobalKey<FormState>();
String _title = '';
String _descriptiion = '';

class _TasksState extends State<Tasks> {
  void openDiaglogbox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add Tasks',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                //title
                TextFormField(
                  decoration: InputDecoration(label: Text('task name')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Valid Task Name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _title = newValue!;
                  },
                ),
                SizedBox(height: 10, width: 10),
                //description
                TextFormField(
                  decoration: InputDecoration(label: Text('description')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter atleast a word as a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _descriptiion = value!;
                  },
                ),
                SizedBox(height: 20, width: 20),
                // filledbutton
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          if (_formGlobalKey.currentState!.validate()) {
                            _formGlobalKey.currentState!.save();
                            todoBox.add(
                              Todo(title: _title, description: _descriptiion),
                            );
                            _formGlobalKey.currentState!.reset();
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: Text('Add'),
                    ),
                    SizedBox(height: 10, width: 10),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: TodoList(todoBox: todoBox, completeBox: completeBox),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDiaglogbox();
          //there will be some logic for opening dialog box
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
