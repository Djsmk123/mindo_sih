import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mindo/models/signup_user_model.dart';
import 'package:provider/provider.dart';

import '../../components/custom_rounded_button.dart';
import '../../components/custom_text_input_field.dart';
import '../../providers/text_field_error_provider.dart';
import '../level_selection_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpUserModel signUpUserModel=SignUpUserModel();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.all(20),
                  child: Center(child: Text("Welcome User",style: Theme.of(context).textTheme.headlineLarge,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomTextInputContainer(
                          errorKey: 'fnm',
                          keyboardTyp: TextInputType.name, valueChanged: (String value) {
                            signUpUserModel.fnm=value;
                        }, valid: (String? value) {
                          String? message;
                          if(value!.isEmpty)
                          {
                            message="First name can't be empty.";
                          }
                          if(message!=null) {
                            Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('fnm', message);
                          }
                          return message;
                        }, label: 'First Name',),
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: CustomTextInputContainer(
                          keyboardTyp: TextInputType.name, valueChanged: (String value) {
                          signUpUserModel.lnm=value;
                        }, valid: (String? value) {
                          return null;
                        }, label: 'Last Name',),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: CustomTextInputContainer(
                    errorKey: 'email',
                    keyboardTyp: TextInputType.emailAddress, valueChanged: (String value) {
                    signUpUserModel.email=value;
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: CustomTextInputContainer(
                    errorKey: 'phno',
                    keyboardTyp: TextInputType.phone, valueChanged: (String value) {
                    signUpUserModel.phno=value;
                  }, valid: (String? value) {
                    String? message;
                    if(value!.length>1 && value.length<10)
                    {
                      message="Enter valid mobile number.";
                    }
                    if(message!=null) {
                      Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('phno', message);
                    }
                    return message;
                  }, label: 'Mobile No.',),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: CustomTextInputContainer(
                    errorKey: 'password',
                    isPassword: true,
                    keyboardTyp: TextInputType.visiblePassword, valueChanged: (String value) {
                    signUpUserModel.pass=value;
                  }, valid: (String? value) {
                    String? message;
                    if(value!.isEmpty)
                    {
                      message="Password can't be empty";
                    }
                    else if(value.length<8)
                      {
                        message="Password minimum length should be 8";
                      }
                    else if(signUpUserModel.pass!=value)
                    {
                      message="Password does not match.";
                    }
                    if(message!=null) {
                      Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('password', message);
                    }
                    return message;
                  }, label: 'Password',),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: CustomTextInputContainer(
                    errorKey: 'password2',
                    isPassword: true,
                    keyboardTyp: TextInputType.visiblePassword, valueChanged: (String value) {
                    signUpUserModel.conPass=value;
                  }, valid: (String? value) {
                    String? message;
                    if(value!.isEmpty)
                    {
                      message="Password can't be empty";
                    }
                    else if(signUpUserModel.pass!=value)
                      {
                        message="Password does not match.";
                      }
                    if(message!=null) {
                      Provider.of<TextFieldErrorProvider>(context, listen: false).setFormError('password2', message);
                    }
                    return message;
                  }, label: 'Confirm Password',),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child:textFieldContainer(Row(
                    children: [
                      Flexible(child: ListTile(
                        leading:  Text(signUpUserModel.dob??"Date of Birth",style: TextStyle(
                          color: const Color(0XFF666161),
                          fontSize: 14.sp,
                        ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 8,right: 0),
                        trailing: IconButton(
                          onPressed: () async {
                            var dataTime=await showDatePicker(context: context, firstDate: DateTime(1940),lastDate: DateTime(2020), initialDate: DateTime(2015),);
                            setState((){
                              signUpUserModel.dob=DateFormat("yyyy-MM-dd").format(dataTime!);
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down,size: 30,),
                        ),
                      ))
                    ],
                  ),)
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                    child: CustomButton(expandedWidth: true, onTap: () {

                      if(formKey.currentState!.validate()){
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LevelSelectionScreen()));
                      }
                    }, buttonText:"Sign  in".toUpperCase()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
