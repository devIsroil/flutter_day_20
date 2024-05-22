import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_20/practise/controllers/counter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final counterController = CounterController();

  void increment() {
    counterController.increment();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MVC Counter")),
      ),
      body: Center(
        child: Text("${counterController.value}",style: TextStyle(fontSize: 50),),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Increment button
          FloatingActionButton(
            onPressed: () {
              increment();
            },
            child: Icon(Icons.add),
          ),

          /// Decrement button
          FloatingActionButton(
            onPressed: () {
              counterController.decrement();
              setState(() {});
            },
            child: Icon(Icons.remove),
          ),

          /// Reset button
          FloatingActionButton(
            onPressed: () {
              counterController.reset();
              setState(() {});
            },
            child: Icon(Icons.settings_backup_restore_rounded),
          ),
        ],
      ),
    );
  }
}
