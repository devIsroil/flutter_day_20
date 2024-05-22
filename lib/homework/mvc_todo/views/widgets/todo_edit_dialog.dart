import 'package:flutter/material.dart';

class ToDoEdit extends StatefulWidget {
  const ToDoEdit({super.key});

  @override
  State<ToDoEdit> createState() => ToDoEditDialogState();
}

class ToDoEditDialogState extends State<ToDoEdit> {
  final _formkey = GlobalKey<FormState>();

  String title = "";
  DateTime? selectedDate;

  void edit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.pop(
        context,
        {
          "title": title,
          "date": selectedDate,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 206, 211, 233),
      title: const Text("Edit todo"),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Title"),

              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please, enter title";
                }
                return null;
              },
              onSaved: (newTodo) {
                if (newTodo != null) {
                  title = newTodo;
                }
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
              },
              child: const Text(
                'Choose new data',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: edit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Edit"),
        )
      ],
    );
  }
}