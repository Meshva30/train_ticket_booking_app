import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:train_ticket_booking_app/view/screen/home/bottom_navigationbar.dart';
import '../controller/auth_controller.dart';
import '../model/firebase_model.dart';
import '../services/google_services.dart';
import '../services/user_services.dart';
import '../view/screen/home/home_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    builder: (context, child) {
      var controller = AuthController();
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.sp),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.sp),
                Text(
                  'Start learning with create your account',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40.sp),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                TextField(
                  controller: controller.txtname,
                  decoration: InputDecoration(
                    labelText: 'Create your username',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person_outline),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffFBFBFD),
                  ),
                ),
                SizedBox(height: 20.sp),
                Text(
                  'Email or Phone Number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                TextField(
                  controller: controller.txtemail,
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
                SizedBox(
                  height: 10.sp,
                ),
                TextField(
                  controller: controller.txtpassword,
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
                SizedBox(height: 30.sp),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map m1 = {
                        'name': controller.txtname.text,
                        'phone':controller.txtphone.text,
                        'email': controller.txtemail.text,
                        'photourl':
                        'https://i.pinimg.com/236x/db/b9/cb/dbb9cbe3b84da22c294f57cc7847977e.jpg',
                      };
                      UserModel usermodel = UserModel.fromMap(m1);
                      await UserServices.userServices.addUser(usermodel);

                      Get.off(BottomNavBar());

                      controller.Signup(
                          controller.txtemail.text, controller.txtpassword.text);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color(0xff005667),
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Center(
                  child: Text(
                    'Or using other method',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                SizedBox(height: 10.sp),
                GestureDetector(
                  onTap: () async {
                    String status = await GoogleSignInServices
                        .googleSignInServices
                        .signWithGoogle();

                    User? user =
                    GoogleSignInServices.googleSignInServices.currentUser();

                    Map m1 = {
                      'name': user!.displayName,
                      'email': user.email,
                      'photourl': user.photoURL,
                    };
                    UserModel userModel = UserModel.fromMap(m1);
                    await UserServices.userServices.addUser(userModel);

                    Fluttertoast.showToast(msg: status);
                    if (status == 'Success') {
                      Get.to( BottomNavBar());
                    }
                  },
                  child: Container(
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
                          style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),


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
                        style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
