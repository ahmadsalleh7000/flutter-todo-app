// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/utils/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet>{
  final GlobalKey<FormState> _formKey                    = GlobalKey<FormState>();
  final TextEditingController _taskTitleController       = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _taskDeadlineController    = TextEditingController();

@override
  void initState() {
    super.initState();
    _setDefaultDeadline();
  }

  void _setDefaultDeadline() {
    DateTime defaultDeadline = DateTime.now().add(const Duration(hours: 24));
    _taskDeadlineController.text = DateFormat('yyyy-MM-dd HH:mm').format(defaultDeadline);
  }


  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(hours: 24)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute),
      );

      if (selectedTime != null) {
        final DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        setState(() {
          _taskDeadlineController.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add new task',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _taskTitleController,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Task Title',hintStyle: Theme.of(context).textTheme.bodyMedium),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _taskDescriptionController,
                decoration: InputDecoration(hintText: 'Task Description',hintStyle: Theme.of(context).textTheme.bodyMedium),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Text("Task Deadline",style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.start,)),
              TextFormField(
                    controller: _taskDeadlineController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                    onTap: () => _selectDateTime(context),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task deadline';
                      }
                      return null;
                    },
                  ),
              const SizedBox(height: 16),
               ElevatedButton(
                style:  ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(APPColors.lightPrimaryColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),                  
                ),
                onPressed: () {
                  addTaskValidator(context);
                },
                child: Text('Submit',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: APPColors.whiteColor),),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    ],);
  }

  void addTaskValidator(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Process the input data
      print('Task Title: ${_taskTitleController.text}');
      print('Task Description: ${_taskDescriptionController.text}');
      print('Task Deadline: ${_taskDeadlineController.text}');
    }
  }
}
