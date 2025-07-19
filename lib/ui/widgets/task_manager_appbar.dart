import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/sign_in_screen.dart';
import 'package:taskmanager/ui/screens/update_profile_screen.dart';

class TaskManagerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({super.key});

  @override
  State<TaskManagerAppBar> createState() => _TaskManagerAppBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TaskManagerAppBar extends State<TaskManagerAppBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapUpdateProfileButton,
      child: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bishal Modak',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'bishal@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: _onTapLogOutButton, icon: Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }

  void _onTapLogOutButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      signInScreen.name,
      (predicate) => false,
    );
  }

  void _onTapUpdateProfileButton() {
    if (ModalRoute.of(context)?.settings.name != UpdateProfileScreen.name) {
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }
}
