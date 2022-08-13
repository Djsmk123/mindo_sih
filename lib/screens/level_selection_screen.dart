import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/background1.dart';
import '../config/theme.dart';
import '../models/levels.dart';


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
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(

                      itemBuilder: (itemBuilder,index){
                      Map item=Stages.levels[index];
                      Widget route=item['route'];
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                        child: Bounce(
                          onPressed:(){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>route));
                          },
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: ListTile(
                                    title: Center(
                                      child: Text(item['title'],style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize:20.sp,
                                        fontWeight: FontWeight.w600
                                      ),
                                      ),
                                    ),

                                    subtitle: Center(
                                      child: Text(item['subtitle'],style: const TextStyle(
                                        color: Colors.black
                                      ),),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      );
                  },
                    shrinkWrap: true,
                    itemCount: Stages.levels.length,

                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
