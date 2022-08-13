import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/components/custom_app.dart';

import '../../components/profile_header.dart';
import '../../models/levels.dart';

class FoundationHomeScreen extends StatefulWidget {
  const FoundationHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoundationHomeScreen> createState() => _FoundationHomeScreenState();
}

class _FoundationHomeScreenState extends State<FoundationHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const CustomAppBar(),
              const ProfileHeader(title: "Foundation Stage",subtitle: "Nursery to 3rd Class",),

              const ActivityMenu(keys: '0',)
            ],
          ),
        ),
      ),
    );
  }
}
class ActivityMenu extends StatelessWidget {
  final String keys;
  const ActivityMenu({Key? key, required this.keys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Activity Section",style: Theme.of(context).textTheme.headlineLarge),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Stages.sections[keys]!.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10, mainAxisExtent: 150
              ), itemBuilder: (itemBuilder,index){
            var item=Stages.sections[keys]![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Bounce(
                onPressed: (){},
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                        colors: [

                          Color(0XFF6C5CFF),
                          Color(0XFF5945FB),
                        ]
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(item['i']),
                      Text(item['t'],style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14.sp,color: Colors.white),)
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
