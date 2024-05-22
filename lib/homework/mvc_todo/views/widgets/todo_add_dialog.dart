
import 'package:flutter/material.dart';

class ToDoAdd extends StatefulWidget {
  const ToDoAdd({super.key});

  @override
  State<ToDoAdd> createState() => _ToDoAddState();
}

class _ToDoAddState extends State<ToDoAdd> {
  final _formkey = GlobalKey<FormState>();

  String title = "";
  DateTime? selectedDate;

  void add() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      Navigator.pop(context, {
        "title": title,
        "date": selectedDate,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add todo"),
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
          onPressed: add,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Add"),
        )
      ],
    );
  }
}
