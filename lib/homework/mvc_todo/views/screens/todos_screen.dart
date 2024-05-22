
import 'package:flutter/material.dart';

import '../../controllers/todos_controller.dart';
import '../widgets/todo_add_dialog.dart';
import '../widgets/todo_edit_dialog.dart';
import '../widgets/todo_item.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final todoController = ToDoController();
  late int countCompleted;
  late int countNotCompleted;

  @override
  void initState() {
    super.initState();
    countCompleted =
        todoController.todos.where((todo) => todo.isDone).toList().length;
    countNotCompleted = todoController.todos
        .where((element) => element.isDone == false)
        .toList()
        .length;
  }

  void deleteT(int index) {
    todoController.todoRemove(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Center(
          child: Text(
            "ToDo App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                barrierDismissible: false,
                  context: context,
                  builder: (ctx) {
                    return const ToDoAdd();
                  });
              todoController.todoAdd(data!['title'], data["date"]);
              setState(() {});
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Done: $countCompleted",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Not Done: $countNotCompleted",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  title: todoController.todos[index].title,
                  onDelete: () {
                    deleteT(index);
                  },
                  onEdit: () async {
                    Map<String, dynamic>? data = await showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const ToDoEdit();
                        });

                    todoController.todoEdit(
                        index, data!["title"], data["date"]);
                    setState(() {});
                  },
                  dateTime: todoController.todos[index].dates,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}