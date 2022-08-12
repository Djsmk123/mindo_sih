
import 'package:flutter/material.dart';
import 'package:mindo/screens/intro_screens/intro_screen.dart';

import '../config/theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading=true;
  late Image backgroundImg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backgroundImg=Image.asset("assets/icons/app_logo.png");
    Future.delayed(const Duration(seconds: 2)).then((value){
      setState((){
        isLoading=false;
      });
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>const IntroScreen()));
    });

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
