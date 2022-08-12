import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindo/components/FadeAnimation.dart';
import 'package:mindo/constants.dart';
import 'package:mindo/screens/authentication_screens/login_screen.dart';
import 'package:mindo/screens/authentication_screens/signup_screen.dart';

import '../../components/custom_rounded_button.dart';



class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late Image headerImage;


  int currentIndex=0;
  List intros=[
    //index: 0
    { 'title': "Building Better\nHumans",
      'details': 'To teach Mindfulness i.e. the state of being in the present and having awareness of oneself and the surroundings.'
    },
    //index: 1
    {
      'title':'To Achieve Mindfulness',
      'details':"1. Being mindful for self\n2. Being mindful for people around you.\n3. Being mindful towards the environment"
    },
    //index: 2
    {
      'title':'A mind is like a parachute,It doesn’t work if it isn’t open',
      'details':'Let’s Get Started'
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headerImage=Image.asset("assets/images/intro_screen/image5.png");
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if(currentIndex!=intros.length-1)
        {
          setState((){
            currentIndex++;
          });

        }
      else{
        timer.cancel();
      }
    });
  }


  @override
  void didChangeDependencies() {
    // to avoid load image after every build.
    precacheImage(headerImage.image, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              headerImage,
              Positioned(
                top: MediaQuery.of(context).size.width/1.2,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  width: 1.sw,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.direction > 0) {
                setState((){
                  if(currentIndex!=intros.length-1) {
                    currentIndex++;
                  }
                });

              }

              // Swiping in left direction.
              else {
                setState((){
                  if(currentIndex!=0) {
                    currentIndex--;
                  }
                });

              }
            },
            child: FadeAnimation(
              1.5,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text(
                          intros[currentIndex]['title'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ))
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text(
                          intros[currentIndex]['details'],

                          style: TextStyle(
                            color: const Color(0XFFBEBDBF),
                            fontSize:16.sp,
                          )
                        ))
                      ],
                    ),
                    SizedBox(height: 80.h,),
                    Row(
                      children: [
                        Flexible(child: CustomButton(expandedWidth: true, onTap: () {
                          if(currentIndex!=intros.length-1)
                            {
                              setState((){
                                currentIndex++;
                              });
                            }
                          else{
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LoginScreen()));
                          }

                        }, buttonText: (currentIndex!=intros.length-1?'Continue':"Sign  in").toUpperCase())),

                        Visibility(
                            visible:currentIndex==intros.length-1 ,
                            child: Flexible(child: CustomButton(
                                color: Colors.white,
                                expandedWidth: true, onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SignUpScreen()));
                            }, buttonText:"Register".toUpperCase(),textColor: const Color(0XFF545151),)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
