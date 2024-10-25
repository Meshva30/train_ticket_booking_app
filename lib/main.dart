import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_booking_app/view/screen/home/bottom_navigationbar.dart';
import 'package:train_ticket_booking_app/view/screen/onboarding/onboardingscreen1.dart';
import 'controller/bottom_navigationbar.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        datePickerTheme: DatePickerThemeData(
          todayBackgroundColor:
              WidgetStateProperty.all<Color>(Color(0xff005667)),
          cancelButtonStyle: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor: WidgetStateProperty.all<Color>(Color(0xff005667)),
          ),
          confirmButtonStyle: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor: WidgetStateProperty.all<Color>(Color(0xff005667)),
          ),

        ),
      ),
      // home: Onboardingscreen1(),
      // home: Loginaccount(),
      home: BottomNavBar(),
      // home: OrderDetils(),
    );
  }
}
