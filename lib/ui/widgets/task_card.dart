import 'package:flutter/material.dart';

enum Tasktype { tNew, progress, completed, canceled }

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.tasktype});

  final Tasktype tasktype;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title is Here',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text('Description', style: TextStyle(color: Colors.black45)),
            Text('Date: 12/12/12'),
            const SizedBox(height: 10),
            Row(
              children: [
                Chip(
                  label: Text(_getTaskTypeName(), style: TextStyle(color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  backgroundColor: _getTaskChipColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide.none,
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTaskChipColor() {
    switch (tasktype) {
      case Tasktype.tNew:
        return Colors.blue;
      case Tasktype.progress:
        return Colors.purple;
      case Tasktype.completed:
        return Colors.green;
      case Tasktype.canceled:
        return Colors.red;
    }
  }

  String _getTaskTypeName() {
    switch (tasktype) {
      case Tasktype.tNew:
        return 'New';
      case Tasktype.progress:
        return 'Progress';
      case Tasktype.completed:
        return 'Completed';
      case Tasktype.canceled:
        return 'Canceled';
    }
  }
}
