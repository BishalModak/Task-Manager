import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_summery_card.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountSummaryCard(title: 'Progress', count: 12);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemCount: 4,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskCard();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onTapAddNewTaskButton, child: Icon(Icons.add),),
    );
  }

  void _onTapAddNewTaskButton(){

}
}

