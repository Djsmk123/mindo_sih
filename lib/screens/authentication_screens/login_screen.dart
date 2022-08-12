import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/components/custom_text_input_field.dart';
import 'package:mindo/providers/text_field_error_provider.dart';
import 'package:mindo/screens/level_selection_screen.dart';
import 'package:provider/provider.dart';

import '../../components/custom_rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? pass;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isForgotPassword=false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(isForgotPassword)
          {
            setState((){
              isForgotPassword=false;
            });
            return false;
          }
        return true;
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(20),
                child: Center(child: Text(!isForgotPassword?"Welcome Back":"Forgot Password??",style: Theme.of(context).textTheme.headlineLarge,)),
              ),
              CustomTextInputContainer(
                errorKey: 'email',
                keyboardTyp: TextInputType.emailAddress, valueChanged: (String value) {
                  email=value;
              }, valid: (String? value) {
                  String? message;
                  if(value!.isEmpty)
                    {
                      message="Email can't be empty.";
                    }
                  else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                    {
                      message="Email address is not valid.";
                    }
                  if(message!=null) {
                    Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('email', message);
                  }
                  return message;
              }, label: 'Email',),
              if(!isForgotPassword)
              CustomTextInputContainer(
                isPassword: true,
                errorKey: 'pass',
                keyboardTyp: TextInputType.visiblePassword, valueChanged: (String value) {
                  pass=value;
              }, valid: (String? value) {
                String? message;
                if(value!.isEmpty)
                {
                  message="Password can't be empty.";
                }
                if(message!=null) {
                  Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('pass', message);
                }
                return message;}, label: 'Password',),
              if(!isForgotPassword)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bounce(onPressed: () {
                    setState((){
                      isForgotPassword=true;
                    });
                  }, duration: const Duration(milliseconds: 200),
                  child: Text("Forgot Password?",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14.sp),),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(expandedWidth: true, onTap: () {
                  if(!isForgotPassword)
                    {
                      if(formKey.currentState!.validate()){
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LevelSelectionScreen()));
                      }
                    }


                }, buttonText:!isForgotPassword? "Sign  in".toUpperCase():"Request"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
