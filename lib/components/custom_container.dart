import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          decoration: BoxDecoration(
              color:const Color(0XFFFFBA00),
              borderRadius: BorderRadius.circular(16)
          ),
          child:child
      ),
    );
  }
}
