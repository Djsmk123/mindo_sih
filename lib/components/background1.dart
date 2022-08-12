 import 'package:flutter/material.dart';

Widget background(child){
  final Image image=Image.asset("assets/images/background1.png",fit: BoxFit.cover,);
  return Scaffold(
      backgroundColor: const Color(0XFF725FFF),
      body:SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: image),
            child,
          ],
        ),
      )
  );
}