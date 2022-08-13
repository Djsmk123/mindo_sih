import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    required this.expandedWidth,
    this.radius,
    this.prefixIcon,
    this.isButton=true,
    this.color,
    this.isLoading=false,
    this.textColor,
  }) : super(key: key);

  final String buttonText;
  final Function() onTap;
  final bool expandedWidth;
  final double? radius;
  final bool isLoading;
  final IconData? prefixIcon;
  final Color? color;
  final Color? textColor;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    return isButton && !isLoading?Bounce(
      onPressed: onTap,
      duration: const Duration(milliseconds: 200),
      child: containerPlaceHolder(context)
    ):containerPlaceHolder(context);
  }
  Widget containerPlaceHolder(context){
   return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10.r),
        color: color ?? kButtonColor,
        boxShadow: const [
          /*  BoxShadow(
                color: Colors.white,
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(0,2)
            ),
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0,2)
            ),*/
        ],
        gradient: color==null?kPrimaryGradient:null,
      ),
      child: Row(
        mainAxisSize: expandedWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Icon(
                prefixIcon,
                color: Colors.white,
              ),
            ),

          !isLoading?Text(
            buttonText,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: textColor ??Colors.white,fontSize: 20.sp),
          ):CircularProgressIndicator(
            color: textColor??Colors.white,
          ),
        ],
      ),
    );
  }
}