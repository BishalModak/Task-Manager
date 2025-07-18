import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/ui/screens/forgot_password_change_password_screen.dart';
import 'package:taskmanager/ui/screens/sign_in_screen.dart';
import 'package:taskmanager/ui/screens/sign_up_screen.dart';
import 'package:taskmanager/ui/widgets/background_screen.dart';

class pinVarificationScreen extends StatefulWidget {
  const pinVarificationScreen({super.key});

  static const String name ='/pin_verification_screen';

  @override
  State<pinVarificationScreen> createState() => _pinVarificationScreenState();
}

class _pinVarificationScreenState extends State<pinVarificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  void dispose() {
    _otpTEController.dispose();
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'PIN Verification',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'A 6 digit varification pin will send to your email address',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 18),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.phone,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        selectedColor: Colors.green,
                        inactiveColor: Colors.grey,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.white,
                      enableActiveFill: true,
                      controller: _otpTEController,
                      appContext: context,
                    ),
                    SizedBox(height: 10),

                    const SizedBox(height: 14),
                    ElevatedButton(
                      onPressed: _onTapSubmitButton,
                      child: Text('Verify', style: TextStyle(color: Colors.white),),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Have Account? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                              children: [
                                TextSpan(
                                  text: 'SignIn',
                                  style: TextStyle(color: Colors.green),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSignInButton,
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
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushNamedAndRemoveUntil(context, signInScreen.name, (predicate)=>false);
  }
  void _onTapSubmitButton() {
    if(_formkey.currentState!.validate()){
      //TODO: SignIN with API
      Navigator.pushReplacementNamed(context, changePasswordScreen.name);
    }
  }
}