import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/widgets/widget_tree.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/boxes.dart';
import 'package:todoapp/views/todo.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hiveLoaded = false;
  @override
  void initState() {
    super.initState();
    loadHiveAndStart();
  }

  Future<void> loadHiveAndStart() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    todoBox = await Hive.openBox<Todo>('todos');
    completeBox = await Hive.openBox<Todo>('completed');

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      hiveLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/lotties/final.json',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'TASKIFY',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          SizedBox(height: 30),
          if (hiveLoaded)
            FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetTree()),
                );
              },
              child: const Text('Click me'),
            ),
        ],
      ),
    );
  }
}
