import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:train_ticket_booking_app/controller/auth_controller.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationId;

  VerificationScreen({super.key, required this.verificationId});

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Verification',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.sp),
                CircleAvatar(
                  radius: 65.sp,
                  backgroundColor: Colors.grey.shade200,
                  child: CircleAvatar(
                    radius: 47.sp,
                    backgroundColor: const Color(0xff005667),
                    child: Icon(
                      Icons.email,
                      size: 35.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.sp),
                Text(
                  'We have sent the code verification to',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                Text(
                  FirebaseAuth.instance.currentUser?.email ?? '',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCodeInputBox(),
                    _buildCodeInputBox(),
                    _buildCodeInputBox(),
                    _buildCodeInputBox(),
                    _buildCodeInputBox(),
                    _buildCodeInputBox(),
                  ],
                ),
                SizedBox(height: 50.sp),
                SizedBox(
                  width: double.infinity,
                  height: 50.sp,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Add submission logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff005667),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: _resendVerificationEmail,
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: const Color(0xff005667),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCodeInputBox() {
    return SizedBox(
      width: 50.sp,
      child: TextField(
        controller: codeController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _resendVerificationEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        Get.snackbar("Resend", "Verification email has been resent!");
      } else {
        Get.snackbar("Error", "User is already verified or not logged in");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
