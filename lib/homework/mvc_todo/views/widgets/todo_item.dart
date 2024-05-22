import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  final Function() onDelete;
  final Function() onEdit;

  const TodoItem({
    super.key,
    required this.title,
    required this.dateTime,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        icon: Icon(
          isChecked ? Icons.check_box : Icons.crop_square,
          color: Colors.green,
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(widget.dateTime.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
