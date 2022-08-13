import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/components/custom_container.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileHeader({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime=DateTime.now();
    List months = ['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    List days=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hi Khush.",style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20.sp)),
              SizedBox(
                width: 120,
                child: ListTile(
                  title: Center(child: Text(days[dateTime.weekday-1])),
                  subtitle: Center(child: Text('${dateTime.day} ${months[dateTime.month-1]}\'${dateTime.year}',style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 14.sp))),
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Divider(
            height: 0,
            thickness: 3,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Keep Learning. Keep Growing",style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp
          ),
          ),
        ),
        CustomContainer(child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(subtitle,style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp
                ),)
              ],
            ))
          ],
        )),

      ],
    );
  }
}
