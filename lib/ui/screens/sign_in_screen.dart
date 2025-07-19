import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/forgot_password_email_varification_screen.dart';
import 'package:taskmanager/ui/screens/main_nav_bar_screen.dart';
import 'package:taskmanager/ui/screens/sign_up_screen.dart';
import 'package:taskmanager/ui/widgets/background_screen.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  static const String name ='/sign-up';

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: backgroundScreen(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (String? value){
                      String email = value ?? '';
                      if(EmailValidator.validate(email) == false){
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value){
                      if((value?.length ?? 0)<=6){
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: _onTapSignInButton,
                    child: Icon(Icons.arrow_circle_right),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgotPasswordButton,
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Don't Have an Account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'SignUp',
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignUpButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    if(_formkey.currentState!.validate()){
      //TODO: SignIN with API
    }
    Navigator.pushNamedAndRemoveUntil(context, mainNavBarScreen.name, (predicate) => false);
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushReplacementNamed(context, emailVarificationScreen.name);
  }

  void _onTapSignUpButton() {
    Navigator.pushReplacementNamed(context, signUpScreen.name);
  }
}
