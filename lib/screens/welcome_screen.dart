
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindo/screens/intro_screens/intro_screen.dart';

import '../config/theme.dart';
import '../services/authentication_services.dart';
import 'level_selection_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading=true;
  late Image backgroundImg;
  final Authentication auth=Authentication();
  @override
  void initState() {
    super.initState();
    backgroundImg=Image.asset("assets/icons/app_logo.png");
    initAsync();

  }
  //checking if user is logged in or not

  void initAsync()async{
    User? usr=await auth.getUser();
    setState((){
      isLoading=false;
    });
    Navigator.pop(context);
    if(usr!=null)
      {

        Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LevelSelectionScreen()));
      }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const IntroScreen()));
    }

  }


  @override
  void didChangeDependencies() {
    // to avoid load image after every build.
    precacheImage(backgroundImg.image, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: backgroundImg,
              ),
              Visibility(
                visible: isLoading,
                child: const CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
