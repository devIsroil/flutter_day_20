
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  ContactAddDialog({super.key});

  @override
  State<ContactAddDialog> createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  final formKey = GlobalKey<FormState>();

  String name = "";

  String phone = "";

  void _add() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pop(context, {"name": name,"phone":phone});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Contact"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter name";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  name = newValue ?? "";
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone number",
                  prefixIcon: Icon(Icons.add)),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter number";
                } else if ((!RegExp(r"^\d+$").hasMatch(value))) {
                  return "Please enter valid number";
                }
                return null;
              },
              onSaved: (newValue) {
              if (newValue != null) {
                phone = newValue ?? "";
              }
            },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              _add();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: Text("Add"))
      ],
    );
  }
}
