import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_20/homework/mvc_contact/controllers/contacts_controller.dart';
import 'package:flutter_day_20/homework/mvc_contact/views/widgets/contact_add_dialog.dart';
import 'package:flutter_day_20/homework/mvc_contact/views/widgets/contact_edit_dialog.dart';
import 'package:flutter_day_20/homework/mvc_contact/views/widgets/contact_item.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final contactController = ContactsController();

  void delete(int index) {
    contactController.delete(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("Contacts",style: TextStyle(color: Colors.white),),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return ContactAddDialog();
                },
              );
              if (data != null) {
                contactController.add(data['name'], data['phone']);
                setState(() {});
              }
            },
            icon: Icon(Icons.add,color: Colors.white,),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactController.contacts.length,
        itemBuilder: (context, index) {
          return ContactItem(
            contact: contactController.contacts[index],
            onDelete: () {
              delete(index);
            },
            onEdit: () async {
              var newContact = await showDialog(
                barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return ContactEditDialog();
                  });
              contactController.edit(index, newContact);
            },
          );
        },
      ),
    );
  }
}
