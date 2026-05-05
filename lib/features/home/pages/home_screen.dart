import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee/core/constant/app_image.dart';
import 'package:coffee/core/constant/app_string.dart';
import 'package:coffee/features/data/map_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/aap_color.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> nameTabs = [
    AppString.t1,
    AppString.t2,
    AppString.t3,
    AppString.t4,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AapColor.primary,
        appBar: AppBar(
          backgroundColor: AapColor.primary,
          title: Text(
            AppString.title,
            style: TextStyle(
              color: AapColor.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'poppins',
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
          leading: Image.asset(AppImage.leading),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Image.asset(AppImage.search),
            ),
          ],
          bottom: TabBar(
            dividerColor: AapColor.primary,
            indicatorColor: AapColor.secondary,
            labelColor: AapColor.secondary,
            unselectedLabelColor: AapColor.white,
            tabs: nameTabs.map((e) => Tab(child: Text(e))).toList(),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(childCount: allData.length, (
                context,
                index,
              ) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/d',
                      arguments: allData[index],
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),

                    decoration: BoxDecoration(
                      color: AapColor.container,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                            width: 220.w,
                            height: 190.h,
                            fit: BoxFit.cover,
                            imageUrl: '${allData[index]['image']}',
                            placeholder:
                                (context, url) => CircularProgressIndicator(
                                  color: AapColor.secondary,
                                ),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          textAlign: TextAlign.center,
                          allData[index]['name'],
                          style: TextStyle(
                            color: AapColor.white,
                            fontSize: 18.sp,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  allData[index]['type'],

                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AapColor.secondary,
                                    fontSize: 10.sp,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  textAlign: TextAlign.right,
                                  '${allData[index]['price']}\$',

                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AapColor.white,
                                    fontSize: 17.sp,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(AppImage.Button),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
