import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:train_ticket_booking_app/controller/auth_controller.dart';

import 'package:train_ticket_booking_app/login/verification_code.dart';

import '../view/screen/home/bottom_navigationbar.dart';

class Loginaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final loginController = Get.put(LoginController());
    var controller = AuthController();
    TextEditingController phonecontroller = TextEditingController();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.sp),
                  Text(
                    'Login Account',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    'Please login with registered account',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 40.sp),
                  Text(
                    'Email or Phone Number',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: controller.txtemail,
                    // Using emailController
                    decoration: InputDecoration(
                      labelText: 'Enter your email or phone number',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.mail_outline),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffFBFBFD),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  TextField(
                    controller: controller.txtpassword,
                    // Using passwordController
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Create your password',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_outlined),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffFBFBFD),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.sp),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.all(16.sp),
                            child: Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 50.sp,
                                        height: 4.sp,
                                        margin: EdgeInsets.only(bottom: 10.sp),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(2.sp),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Enter your email or phone number',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 20.sp),
                                    Text(
                                      'Email or Phone Number',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.sp),
                                    TextField(
                                      controller:
                                          controller.resetEmailController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        ),
                                        labelText: 'Email or Phone Number',
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        prefixIcon: Icon(
                                          Icons.mail_outline,
                                          color: Color(0xff005667),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 1.5)),
                                        filled: true,
                                        fillColor: Color(0xffFBFBFD),
                                      ),
                                    ),
                                    SizedBox(height: 30.sp),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final phoneNumber =
                                              phonecontroller.text.trim();

                                          // Validate the phone number format for India
                                          if (_isValidIndianPhoneNumber(
                                              phoneNumber)) {
                                            controller.phoneNumberVerification(
                                                phoneNumber: phoneNumber);
                                          } else {
                                            Get.snackbar(
                                              "Error",
                                              "Please enter a valid Indian phone number with the country code (e.g., +919876543210).",
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          backgroundColor: Color(0xff005667),
                                        ),
                                        child: Text(
                                          'Send Code',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Color(0xff005667),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 55.sp),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.signIn(controller.txtemail.text,
                            controller.txtpassword.text);
                        Get.to(BottomNavBar());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Color(0xff005667),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  Center(
                    child: Text(
                      'Or using other method',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(height: 15.sp),
                  // Google sign in button
                  Container(
                    height: 58.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.sp,
                        ),
                        Container(
                            height: 31.sp,
                            child: Image.asset('assets/img/google.png')),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Text(
                          'Sign Up with Google',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  // Facebook sign in button
                  Container(
                    height: 58.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.sp,
                        ),
                        Container(
                            height: 31.sp,
                            child: Image.asset('assets/img/facebook.png')),
                        SizedBox(
                          width: 5.sp,
                        ),
                        Text(
                          'Sign Up with Facebook',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isValidIndianPhoneNumber(String phoneNumber) {

    final indianPhoneRegex = RegExp(r'^\+91[6-9]\d{9}$');
    return indianPhoneRegex.hasMatch(phoneNumber);
  }
}
