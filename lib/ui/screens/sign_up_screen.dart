import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/data/service/network_caller.dart';
import 'package:taskmanager/ui/screens/sign_in_screen.dart';
import 'package:taskmanager/ui/widgets/background_screen.dart';
import 'package:taskmanager/ui/widgets/snak_bar_message.dart';

import '../../data/urls.dart';
import 'forgot_password_email_varification_screen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  static const String name = '/sign-Up';

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
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
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (String? value) {
                      if (!EmailValidator.validate(value ?? '')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if ((value ?? '').length < 11) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Password must be more than 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  Visibility(
                    visible: _signUpInProgress == false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: _onTapSignUpButton,
                      child: const Icon(Icons.arrow_circle_right),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
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
    Navigator.pushReplacementNamed(context, signInScreen.name);
  }

  void _clearTextFields(){
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
  }

  void _onTapSignUpButton() {
    if (_formkey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async{
    _signUpInProgress=false;
    setState(() {});
    Map<String, String> requestBody ={
      "email" : _emailController.text.trim(),
      "firstName" : _firstNameController.text.trim(),
      "lastName" : _lastNameController.text.trim(),
      "mobile" : _phoneController.text.trim(),
      "password" : _passwordController.text,
    };
    NetworkResponse response = await NetworkCaller.postRequest(url: Urls.registrationUrl, body:  requestBody);
    if (response.isSuccess){
      _clearTextFields();
      showSnaackBarMessage(context, 'Registration has been success. Please Login.');
    }else {
      showSnaackBarMessage(context, response.errorMessage!);
    }

  }
  void _onforgotpasswordemailvarification() {
    Navigator.pushReplacementNamed(context, emailVarificationScreen.name);
  }
}
