import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSeatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF00676C),
      appBar: AppBar(
        backgroundColor: Color(0xFF00676C),
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Text(
          "Select Your Seat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.info_outline, color: Colors.white),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFCCE3E4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black54),
                  SizedBox(width: 5),
                  Text(
                    'The remaining time of ordar',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xff005667)),
                  ),
                  SizedBox(width: 5),
                  Text("00:07:20",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.train,
                        color: Color(0xff005667),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Pensitanian Train',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff005667),
                          ),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 15,
                          )),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '24 feb 2024',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        'Jhone Crothone',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Business',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '2A',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _seatStatus("Available", Colors.white),
                _seatStatus("Filled", Color(0xFFFF8B2D)),
                _seatStatus("Selected", Color(0xff005667)),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Seat Grid Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Wagon Header Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Wagon",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("A",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("B",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("C",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("D",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("E",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Seat Grid
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(4, (index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      height: 165,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: index == 1
                                            ? Color(0xff005667)
                                            : Colors.white,
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text("${index + 1}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey)),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Seat Grid
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: 55,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: index % 3 == 0
                                          ? Color(0xFFFF8B2D) // Filled seats
                                          : index % 4 == 0
                                              ? Color(
                                                  0xff005667) // Selected seat
                                              : Colors.white, // Available seat
                                      border: Border.all(color: Colors.black38),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff005667),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'Select Your Seat',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _seatStatus(String status, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 10),
        Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
