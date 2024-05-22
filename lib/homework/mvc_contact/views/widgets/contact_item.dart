import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function() onDelete;
  final Function() onEdit;


  ContactItem({super.key, required this.contact, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: contact.color,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
