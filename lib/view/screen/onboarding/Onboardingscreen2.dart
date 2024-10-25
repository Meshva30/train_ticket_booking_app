


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'onboardingscreen3.dart';

class Onboardingscreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/Onboarding-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
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
                        'Enjoy The Convenience Of\nBuying Tickets For Your Trip',
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
                          SizedBox(width: 5.sp),
                          Container(
                            height: 7.sp,
                            width: 7.sp,
                            decoration: BoxDecoration(
                              color: Color(0xffDCDFE6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5.sp),
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
                          Get.to(Onboardingscreen3());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff005667),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 100),
                        ),
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
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
      },
    );
  }
}
