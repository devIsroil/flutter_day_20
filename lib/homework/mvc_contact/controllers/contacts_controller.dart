import 'dart:math';

import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactsController {
  final List<Contact> _contacts = [
    Contact(
      name: "Jack",
      phone: "+998 90 123 45 67",
    ),
    Contact(name: "Andrew", phone: "+998 90 123 45 67", color: Colors.red),
    Contact(name: "Robert", phone: "+998 97 321 45 04", color: Colors.blue),
    Contact(name: "Jackson", phone: "+998 91 843 45 97", color: Colors.amber),
    Contact(name: "George", phone: "+998 95 223 34 85", color: Colors.black),
  ];

  List<Contact> get contacts {
    return [..._contacts];
  }

  void add(String name, String phone) {
    int red = Random().nextInt(255);
    int green = Random().nextInt(255);
    int blue = Random().nextInt(255);

    _contacts.add(
      Contact(
        name: name,
        phone: phone,
        color: Color.fromARGB(255, red, green, blue),
      ),
    );
  }

  void delete(int index) {
    _contacts.removeAt(index);
  }
  void edit(int index,Contact newContact){
    _contacts[index] = newContact;
  }
}
