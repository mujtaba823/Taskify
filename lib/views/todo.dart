// class Todo {
//   const Todo({required this.title, required this.description});
//   final String title;
//   final String description;
// }
import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  Todo({required this.title, required this.description});

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;
}
