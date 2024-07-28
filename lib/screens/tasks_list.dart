import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.amber,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text('Task 1'),
              Text('Task 2'),
              Text('Task 3'),
            ],
          ),
        ),
      ),
    );
  }
}