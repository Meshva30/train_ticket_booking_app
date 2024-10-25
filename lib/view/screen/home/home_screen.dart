import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:train_ticket_booking_app/login/CreateAccountScreen.dart';
import 'package:train_ticket_booking_app/view/screen/home/search_tickets.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/date_controller.dart';
import '../../../controller/search_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          AuthController controller = Get.put(AuthController());
          final DateController dateController = Get.put(DateController());
          final TrainSearchController trainSearchController =
              Get.put(TrainSearchController());
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25.sp,
                          backgroundImage: AssetImage('assets/img/profile.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Jonathan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.sp),
                              ),
                              Text(
                                "Let's take a vacation",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(Icons.notifications_outlined),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Where are you\ngoing right now?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp),
                          ),
                        ),
                        Container(
                          height: 150.sp,
                          width: 150.sp,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/train.png'))),
                        )
                      ],
                    ),
                    Container(
                      height: 450.sp,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40.sp,
                                width: 90.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xff005667),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'One Way',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Round-trip",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.sp),
                          Text(
                            "From",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                          TextField(
                            onChanged: (value) {
                              trainSearchController.fromLocation.value = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: Icon(Icons.flight_takeoff),
                              hintText: "New York City       NYC",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.swap_vert),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              ),
                              TextField(
                                onChanged: (value) {
                                  trainSearchController.toLocation.value =
                                      value;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  prefixIcon: Icon(Icons.flight_land),
                                  hintText: "Pennsylvania       PNV",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10.sp),
                              Text(
                                "Date",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              ),
                              Obx(() => TextField(
                                    controller: TextEditingController(
                                        text:
                                            dateController.selectedDate.value),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? selectedDate =
                                          await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1947),
                                        lastDate: DateTime(2047),
                                        initialDate: DateTime.now(),
                                      );

                                      if (selectedDate != null) {
                                        String formattedDate =
                                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                        dateController
                                            .updateDate(formattedDate);
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(Icons.calendar_today),
                                      suffixIcon: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Return?",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          Switch(
                                            activeTrackColor: Color(0xff005667),
                                            value: true,
                                            onChanged: (bool newValue) {},
                                          ),
                                        ],
                                      ),
                                      hintText: "Select a date",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                          GestureDetector(
                            onTap: () {
                              trainSearchController.searchTrains();
                              Get.to(TicketSearchScreen());
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff005667),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Search Ticket',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hot News',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                              color: Color(0xff005667),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      height: 130.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' 2 Central American\n migrants found dead in\n Mexico after trying to bo...',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16.sp),
                                ),
                                Container(
                                  height: 90.sp,
                                  width: 90.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/img/train2.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Brianna Wiest',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Icon(
                                  Icons.message,
                                  color: Colors.grey,
                                  size: 13,
                                ),
                                Text('28',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Text('12h',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Icon(
                                  Icons.more_horiz_outlined,
                                  size: 13,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      height: 130.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Train strikes:Full list of\n dates and lines affected as\n rail and Tube action anno..',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16.sp),
                                ),
                                Container(
                                  height: 90.sp,
                                  width: 90.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/img/train3.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Brianna Wiest',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Icon(
                                  Icons.message,
                                  color: Colors.grey,
                                  size: 13,
                                ),
                                Text('28',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Text('12h',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                                SizedBox(
                                  width: 15.sp,
                                ),
                                Icon(
                                  Icons.more_horiz_outlined,
                                  size: 13,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
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
