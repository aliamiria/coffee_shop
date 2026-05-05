import 'package:coffee/features/home/pages/home_screen.dart';
import 'package:coffee/features/splash/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/details/pages/details.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
     designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(


        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashScreen(),
          '/home': (context)=>HomeScreen(),
          '/details': (context)=>De(),
        },

      ),
    );
  }
}
