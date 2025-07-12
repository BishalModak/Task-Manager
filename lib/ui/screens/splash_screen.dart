import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/ui/screens/sign_in_screen.dart';
import 'package:taskmanager/ui/utils/assets_path.dart';
import 'package:taskmanager/ui/widgets/background_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  static const String name ='/';

  @override
  State<splashScreen> createState() => _splashScreenState();
}


class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToTheNextPage();
  }
  
  Future<void> _moveToTheNextPage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, signInScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: backgroundScreen(child: Center(child: SvgPicture.asset(AssetPath.logoPath)),
      ),
    );
  }
}
