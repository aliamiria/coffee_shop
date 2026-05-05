import 'package:coffee/core/constant/app_image.dart';
import 'package:coffee/core/constant/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/aap_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goNext();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImage.backGroundSplash, fit: BoxFit.cover),
          tex(AppString.title, 32, 150, 100),
          tex(AppString.subTitle, 24, 200, 80),
        ],
      ),
    );
  }





  tex(String t, int size, int top, int right) {
    return Positioned(
      top: top.h,
      right: right.w,
      child: Text(
        t,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size.sp,
          fontFamily: 'Poppins',
          color: AapColor.brownText,
        ),
      ),
    );
  }
  void goNext()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamed(context, '/home');
  }




}
