import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/background_screen.dart';
import 'package:taskmanager/ui/widgets/task_manager_appbar.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      body: backgroundScreen(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Text('Add New Task' ,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16,),
                TextFormField(
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter Your title';
                    }
                  },
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Subject'
                  ),
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Enter Your description';
                    }
                  },
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description',
                  ),
                ),
                const SizedBox(height: 16,),
                ElevatedButton(onPressed: _onTapButtonSubmit, child: Icon(Icons.arrow_circle_right_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapButtonSubmit(){
    if(_formkey.currentState!.validate()){
      //TODO: Add new Task
    }
    Navigator.pop(context);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionController.dispose();
    _titleController.dispose();
  }
}
