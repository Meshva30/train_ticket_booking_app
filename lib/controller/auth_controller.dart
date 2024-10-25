  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
  import 'package:get/get.dart';

  import '../login/verification_code.dart';
import '../services/auth_services.dart';
  import '../services/google_services.dart';
import '../view/screen/home/home_screen.dart';

  class AuthController extends GetxController {



    TextEditingController txtemail = TextEditingController();
    TextEditingController txtpassword = TextEditingController();
    TextEditingController txtname = TextEditingController();
    TextEditingController txtphone = TextEditingController();
    TextEditingController resetEmailController = TextEditingController();


    RxString email = ''.obs;
    RxString name = ''.obs;
    RxString url = ''.obs;
    RxString receiveremail = ''.obs;
    RxString receivername = ''.obs;

    @override
    void onInit() {
      super.onInit();
      UserDetails();
    }

    void getreceiver(String email, String name) {
      receiveremail.value = email;
      receivername.value = name;
    }

    void UserDetails() {
      User? user = GoogleSignInServices.googleSignInServices.currentUser();
      if (user != null) {
        email.value = user.email!;
        name.value = user.displayName ?? 'No Name';
        url.value = user.photoURL ?? '';
      }
    }

    Future<void> Signup(String email, String password) async {
      try {
        bool emails = await AuthServices.authServices.CheckEmail(email);
        if (emails) {
          Get.snackbar(
            'Sign Up Failed',
            'Email already in use. Please use a different email.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          await AuthServices.authServices.CreateAccount(email, password);
          Get.snackbar(
            'Sign Up',
            'Sign Up Successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // After signup, send email verification
          sendEmailVerification();
        }
      } catch (e) {
        Get.snackbar(
          'Sign Up Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    Future<void> signIn(String email, String password) async {
      try {
        User? user = await AuthServices.authServices.Signin(email, password);
        if (user != null && user.emailVerified) {
          Get.to(HomeScreen());
          UserDetails();
        } else if (user != null && !user.emailVerified) {
          Get.snackbar(
            'Login Failed',
            'Please verify your email before logging in.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Login Failed',
            'Incorrect email or password.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Login Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    Future<void> sendEmailVerification() async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          Get.snackbar(
            'Verification Email Sent',
            'A verification email has been sent to ${user.email}.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to send verification email: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    void emailLogOut() {
      AuthServices.authServices.signout();
      GoogleSignInServices.googleSignInServices.emailLogOut();
    }

    Future<void> phoneNumberVerification({required String phoneNumber}) async {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieval scenario where the phone is verified without manual input
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          Fluttertoast.showToast(
            msg: "Verification Failed: ${e.message}",
            backgroundColor: Colors.red,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(VerificationScreen(verificationId: verificationId,));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
