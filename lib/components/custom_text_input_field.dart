


// ignore: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/components/FadeAnimation.dart';
import 'package:mindo/providers/text_field_error_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomTextInputContainer extends StatefulWidget {
  final String errorKey;
  CustomTextInputContainer(
      {Key? key,
        this.maxLines = 1,
        required this.label,
        required this.valid,
        required this.valueChanged,
        required this.keyboardTyp,
        this.isPassword=false,
        this.errorKey = ""})
      : super(key: key);
  final String label;
  final FormFieldValidator<String> valid;
  final ValueChanged<String> valueChanged;
  final TextInputType keyboardTyp;
  int maxLines;
  bool isPassword;
  
  @override
  State<CustomTextInputContainer> createState() =>
      _CustomTextInputContainerState();
}

class _CustomTextInputContainerState extends State<CustomTextInputContainer> {
  var error = "";
  var periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  bool isVisiblePassword=false;

  hideError() async {
    periodicTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (error != "") {
        Provider.of<TextFieldErrorProvider>(context, listen: false)
            .hideFormErrors(widget.errorKey);
      }
    });
  }

  @override
  initState() {
    super.initState();
    hideError();
  }

  @override
  void dispose() {
    super.dispose();
    periodicTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    error = Provider.of<TextFieldErrorProvider>(context).getFormError(widget.errorKey);
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: Column(
        children: [
         textFieldContainer( TextFormField(
           validator: widget.valid,
           onChanged: widget.valueChanged,
           keyboardType: widget.keyboardTyp,
           maxLines: widget.maxLines,
           autocorrect: true,
           obscureText: widget.isPassword?isVisiblePassword:false,
           decoration: InputDecoration(
               hintText: widget.label,
               hintStyle: TextStyle(
                 color: const Color(0XFF666161),
                 fontSize: 14.sp,
               ),
               //labelText: widget.label,
               contentPadding:
               const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
               errorText: "",
               enabledBorder: InputBorder.none,
               border: InputBorder.none,
               errorStyle: const TextStyle(fontSize: 0),
               suffixIcon:widget.isPassword?IconButton(onPressed: (){
                 setState((){
                   isVisiblePassword=!isVisiblePassword;
                 });
               }, icon: Icon(isVisiblePassword?Icons.visibility_off:Icons.visibility)):null
           ),
         ),),
          if (error != "")
            FadeAnimation(
                0.1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: ListTile(
                            leading: const Icon(Icons.error_outline,
                                color: Colors.red),
                            horizontalTitleGap: 0,
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              error.toString(),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            ))),
                  ],
                )),
        ],
      ),
    );
  }
}
Widget textFieldContainer(child){
  return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),

      decoration: BoxDecoration(
          color: const Color(0XFFF3F3F3),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
                spreadRadius: 0,
                offset: Offset(0,2)
            )
          ],
          borderRadius: BorderRadius.circular(15)),
      child: child
  );
}
