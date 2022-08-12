import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../../components/custom_rounded_button.dart';
import '../../models/school_levels.dart';

class SchoolLevelsScreen extends StatelessWidget {
  final SchoolLevels schoolLevels=SchoolLevels();
  SchoolLevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    CustomButton(
                      expandedWidth: true, buttonText:"School Level".toUpperCase(), onTap: () {  },),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Choose your stage according to your class division."),
                    ),
                  ],
                ),
              ),
            ),

            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0,top: 200),
                  child: Image.asset("assets/images/boy.png",height: 150),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 350,right: 20),
                child: Column(
                  children: [
                    Expanded(child: ListView.builder(
                        itemBuilder: (itemBuilder,index){
                          var tile=schoolLevels.levels[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Bounce(
                          onPressed: (){},
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: tile['clr'],
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(child: ListTile(
                                  title: Text(tile['title']),
                                  subtitle:Text(tile['subtitle']),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                      shrinkWrap: true,
                      itemCount: schoolLevels.levels.length,
                    )
                    )
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/girl.png",height: 150,)),


          ],
        ),
      ),
    );
  }
}
