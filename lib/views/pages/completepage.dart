import 'package:flutter/material.dart';
import 'package:todoapp/data/boxes.dart';
import 'package:todoapp/widgets/complete_list.dart';

class Completepage extends StatelessWidget {
  const Completepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Expanded(child: CompleteList(completeBox: completeBox))],
        ),
      ),
    );
  }
}
