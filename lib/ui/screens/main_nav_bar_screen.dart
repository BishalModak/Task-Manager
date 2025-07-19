import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/new_task_list_screen.dart';
import 'package:taskmanager/ui/screens/progress_task_screen.dart';

import '../widgets/task_manager_appbar.dart';

class mainNavBarScreen extends StatefulWidget {
  const mainNavBarScreen({super.key});

  static const String name = '/main-nav-bar';

  @override
  State<mainNavBarScreen> createState() => _mainNavBarScreenState();
}

class _mainNavBarScreenState extends State<mainNavBarScreen> {
  List<Widget> _screens = [
      newTaskList(), ProgressTaskScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex = index;
          setState(() {

          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_circle_right_outlined),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel),
            label: 'Cancel',
          ),
        ],
      ),
    );
  }
}

