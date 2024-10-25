import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'onboarding4_screen.dart';

class Onboardingscreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return Scaffold(
            body: Column(
              children: [
                // Top image section
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Onboarding-2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Bottom content section
                Expanded(
                  flex: 4, // This takes up about 40% of the screen height
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Access From Your\nSmartPhone Anywhere',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          'Urna amet, suspendisse ullamcorper ac elit diam\nfacilisis cursus vestibulum.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 20.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 7.sp,
                              width: 7.sp,
                              decoration: BoxDecoration(
                                color: Color(0xff005667),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5.sp), // Spacing between circles
                            Container(
                              height: 7.sp,
                              width: 7.sp,
                              decoration: BoxDecoration(
                                color: Color(0xffDCDFE6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5.sp), // Spacing between circles
                            Container(
                              height: 7.sp,
                              width: 7.sp,
                              decoration: BoxDecoration(
                                color: Color(0xffDCDFE6),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(Onboardingscreen4());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff005667), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 100),
                          ),
                          child: Text(
                            'Create Account',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30.sp),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Already Have an Account',
                            style: TextStyle(
                              color: Color(0xff005667),
                              fontWeight: FontWeight.bold,
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
        });
  }
}
