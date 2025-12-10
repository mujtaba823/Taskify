import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/views/todo.dart';

class CompleteList extends StatefulWidget {
  const CompleteList({super.key, required this.completeBox});
  final Box<Todo> completeBox;
  @override
  State<CompleteList> createState() => _CompleteListState();
}

class _CompleteListState extends State<CompleteList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.completeBox.listenable(),
      builder: (context, Box<Todo> box, child) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final reversedIndex = box.length - 1 - index;
            final Todo completedTodo = box.getAt(reversedIndex)!;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,

                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          completedTodo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),

                        Text(completedTodo.description),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            box.deleteAt(index);
                          },
                          icon: Icon(Icons.delete_forever),
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
