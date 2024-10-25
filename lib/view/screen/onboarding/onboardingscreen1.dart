import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Onboardingscreen2.dart';

class Onboardingscreen1 extends StatelessWidget {
  const Onboardingscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Get.to(Onboardingscreen2()),
    );
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) {
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Image.asset(
            'assets/img/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
