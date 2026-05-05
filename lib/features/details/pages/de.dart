import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee/core/constant/aap_color.dart';
import 'package:coffee/core/constant/app_icon.dart';
import 'package:coffee/core/constant/app_image.dart';
import 'package:coffee/core/constant/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class De extends StatefulWidget {
  De({super.key});

  @override
  State<De> createState() => _DeState();
}

class _DeState extends State<De> {
  int itemPrice = 0;
  int total = 0;
  Color sellect = AapColor.grey;
  int count = 0;

  @override
  Widget build(BuildContext context) {
     final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            height: 416.h,
            width: 375.w,
            fit: BoxFit.cover,
            imageUrl: product['image'],
            placeholder:
                (context, url) =>
                    CircularProgressIndicator(color: AapColor.secondary),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 460.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: AapColor.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.r),
                  topRight: Radius.circular(35.r),
                ),
              ),
            ),
          ),
          Container(
            height: 1.sh,
            width: 1.sw,

            child: Padding(
              padding: EdgeInsets.only(top: 370.h),
              child: Column(
                children: [
                  Image.asset(AppImage.Rectangle),
                  SizedBox(height: 5),
                  Text(
                    product['name'],
                    style: TextStyle(
                      color: AapColor.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      fontSize: 32.sp,
                      letterSpacing: 0.75,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    product['notes'],
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                      color: AapColor.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Icon(AppIcon.star, color: AapColor.orange),
                      SizedBox(width: 5.w),
                      Text(
                        product['id'].toString(),
                        style: TextStyle(
                          color: AapColor.orange,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'poppins',
                          fontSize: 17.sp,
                          letterSpacing: 0.75.r,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        '(' + product['id'].toString() + 'k)',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'poppins',
                          letterSpacing: 0.75.r,
                          color: AapColor.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 300.w,
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      AppString.size,
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AapColor.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildBottun(1, AppImage.cup1),
                      buildBottun(2, AppImage.cup2),
                      buildBottun(3, AppImage.cup3),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildCircle(op: '-',o: () {setState(() {
                       if(count!=0)  count--;
                        total=itemPrice*count;
                      });},),
                      Text(
                        count.toString(),
                        style: TextStyle(
                          color: AapColor.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: 'poppins',
                        ),
                      ),
                      buildCircle(op: '+',o: () {
                        setState(() {
                          count++;
                          total=itemPrice*count;
                        });
                      },),
                      SizedBox(width: 150.w),
                      Text(
                        '\$${total.toString()}',
                        style: TextStyle(
                          color: AapColor.white,
                          fontFamily: 'poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  GestureDetector(
                    child: Container(
                      height: 56.h,
                      width: 323.w,
                      decoration: BoxDecoration(
                        color: AapColor.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          AppString.bottun,
                          style: TextStyle(
                            color: AapColor.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: 'poppins',
                            letterSpacing: 0.75.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottun(int i, String img) {
    return InkWell(
      onTap: () {
        setState(() {
          if (sellect == AapColor.grey) {
            sellect = AapColor.secondary;
          } else {
            sellect = AapColor.grey;
          }
          if (i == 1) {
            itemPrice = 5;
          } else if (i == 2) {
            itemPrice = 7;
          } else if (i == 3) {
            itemPrice = 9;
          }
        });
      },
      child: Container(
        height: 44.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: AapColor.container,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 0.2.w, color: sellect),
        ),
        child: Image.asset(img, color: sellect),
      ),
    );
  }

  Widget buildCircle({required String op,void Function()? o}) {
    return InkWell(
      onTap: o,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          height: 32.h,
          width: 32.w,
          decoration: BoxDecoration(
            color: AapColor.container,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              op,
              style: TextStyle(
                fontSize: 20.sp,
                color: AapColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
