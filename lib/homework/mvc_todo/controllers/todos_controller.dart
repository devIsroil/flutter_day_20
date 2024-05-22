import '../models/todos.dart';

class ToDoController {
  final List<ToDo> _todos = [
    ToDo(title: "Start new project", dates: DateTime(2024,07,05), isDone: false),
    ToDo(title: "Finish all tasks", dates: DateTime(2024,05,20), isDone: true),
    ToDo(title: "Go to the gym", dates: DateTime(2024,06,16), isDone: false),
    ToDo(title: "Reading books", dates: DateTime(2024,05,04), isDone: true),
    ToDo(title: "Homework", dates: DateTime(2024,05,16), isDone: true),

  ];

  List<ToDo> get todos {
    return [..._todos];
  }

  void todoAdd(String title, DateTime dates) {
    _todos.add(ToDo(title: title, dates: dates,));
  }

  void todoRemove(int index) {
    _todos.removeAt(index);
  }

  void todoEdit(int index, String newTitle, DateTime newDates) {
    _todos[index].title = newTitle;
    _todos[index].dates = newDates;
  }
}
