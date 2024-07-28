import 'package:flutter/material.dart';
import 'package:todo/screens/add_task_bottom_sheet.dart';
import 'package:todo/screens/settings.dart';
import 'package:todo/screens/tasks_list.dart';
import 'package:todo/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex       = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text('To Do List',style: Theme.of(context).textTheme.titleLarge),
        toolbarHeight: MediaQuery.of(context).size.height * Constants.appBarHight,
      ),
      body: Column(children: [pages[currentIndex]],),  
      bottomNavigationBar: BottomAppBar(
        shape          : const CircularNotchedRectangle(),
        notchMargin    : 10,
        child          : Wrap(
          children      : [
            BottomNavigationBar(
            currentIndex : currentIndex,
            onTap        : (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items       : const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
            ],
          ),
        ],),
      ),  
      floatingActionButton: FloatingActionButton(
        onPressed       : () {
          addTaskBottomSheet(context);
        },
        child           : const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    );
  }

  List <Widget> pages = const [
    TasksList(),
    Settings(),
  ];
}

void addTaskBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) =>  const AddTaskBottomSheet(),
  );
}