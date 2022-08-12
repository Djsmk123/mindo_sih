import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/screens/school_level/level_selection_screen.dart';

import '../components/background1.dart';
import '../components/custom_rounded_button.dart';
import '../config/theme.dart';


class LevelSelectionScreen extends StatelessWidget {

  const LevelSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return background(childrens(context));
  }
  Widget childrens(context){
   return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 50),
            child: Text("Choose your Level\naccording to\nyour education.",style: TextStyle(
              color: Colors.white,
              fontSize: 32.sp,

            ),),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                  color: Colors.white,
                  expandedWidth: true, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=> SchoolLevelsScreen()));
                }, buttonText:"School Level".toUpperCase(),textColor:kPrimaryColor,),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                  color: Colors.white,
                  expandedWidth: true, onTap: () {
                }, buttonText:"University Level".toUpperCase(),textColor:kPrimaryColor,),
              )
            ],
          ),
        )
      ],
    );
  }
}
