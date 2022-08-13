// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindo/components/custom_text_input_field.dart';
import 'package:mindo/config/theme.dart';
import 'package:mindo/providers/text_field_error_provider.dart';
import 'package:mindo/screens/level_selection_screen.dart';
import 'package:mindo/services/authentication_services.dart';
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
  bool isLoading=false;
  final Authentication authentication=Authentication();
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
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
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
                      child: CustomButton(
                           isLoading: isLoading,
                          expandedWidth: true, onTap: ()async {
                        if(formKey.currentState!.validate()){
                          if(!isForgotPassword)
                          { setState((){
                            isLoading=true;
                          });
                            try{
                              await authentication.login(email: email!, password: pass!).then((value){
                                    Navigator.popUntil(context, (route) => route.isFirst);
                                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LevelSelectionScreen()));
                              });
                            }catch(e){
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          setState((){
                            isLoading=false;
                          });
                          }
                        }



                      }, buttonText:!isForgotPassword? "Sign  in".toUpperCase():"Request"),
                    ),
                     const SizedBox(height: 50,),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Flexible(
                            child: Divider(
                              height: 5,
                              thickness: 2,
                              color:kPrimaryColor
                            ),
                          ),
                          SizedBox(width: 20,),
                          Flexible(child: Text("Or Sign up With",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14
                            ),)),
                          SizedBox(width: 20,),
                          Flexible(
                            child: Divider(
                              height: 5,
                                thickness: 2,
                                color:kPrimaryColor
                            ),
                          ),
                        ],
                      ),
                    ),
                     Padding(padding: const EdgeInsets.symmetric(vertical: 20),child:Center(
                      child: Bounce(
                        onPressed:!isLoading? ()async{
                          setState((){
                            isLoading=true;
                          });
                          try{
                            await authentication.signInWithGoogle().then((value){
                              Navigator.popUntil(context, (route) => route.isFirst);
                              Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LevelSelectionScreen()));
                            });
                          }
                          catch(e)
                          {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                          setState((){
                            isLoading=false;
                          });

                        }:(){},
                        duration: const Duration(milliseconds: 200),
                        child: Image.asset("assets/icons/Google logo.png"),
                      ),
                    ),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
