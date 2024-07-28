import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
              Text('Settings 1'),
              Text('Settings 2'),
              Text('Settings 3'),
            ],
          ),
        ),
      ),
    );
  }
}