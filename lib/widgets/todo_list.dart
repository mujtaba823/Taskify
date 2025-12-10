import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/views/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todoBox, required this.completeBox});
  final Box<Todo> todoBox;
  final Box<Todo> completeBox;
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.todoBox.listenable(),
      builder: (context, Box<Todo> box, _) {
        return ListView.builder(
          itemCount: box.length,

          padding: EdgeInsets.zero,

          itemBuilder: (context, index) {
            final reversedindex = box.length - 1 - index;
            final Todo currentTodo = box.getAt(reversedindex)!;
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          currentTodo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(currentTodo.description),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: () {
                            widget.completeBox.add(
                              Todo(
                                title: currentTodo.title,
                                description: currentTodo.description,
                              ),
                            );
                            box.deleteAt(reversedindex);
                          },
                          icon: Icon(Icons.task),
                        ),
                        IconButton(
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            box.deleteAt(reversedindex);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
