import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../../controller/ticket_controller.dart';
import 'compoes/ticket_screen.dart';

class TicketSearchScreen extends StatelessWidget {
  TicketSearchScreen({Key? key}) : super(key: key);

  final TicketController ticketController = Get.put(TicketController());
  final RxString selectedDate = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E63),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Search Ticket',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {}, // Add filter functionality here if needed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
    if (ticketController.isLoading.value) {
    return Center(child: CircularProgressIndicator());
    } else if (ticketController.filteredTrains.isEmpty) {
    return Center(child: Text('No tickets available'));
    } else {
      return Column(
        children: [
          Container(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCityInfo('NYC', 'New York City'),
                    Icon(Icons.train, color: Color(0xFF075E63)),
                    _buildCityInfo('PNV', 'Pennsylvania'),
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoText('Type', 'One Way'),
                    _buildInfoText('Class', 'Business'),
                    _buildInfoText('Passenger', '2 Adults'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 60.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(31, (index) {
                final day = (index + 1).toString().padLeft(2, '0');
                final weekday = [
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                  'Sun'
                ][(index % 7)];
                return _buildDateButton(
                    day, weekday, ticketController, selectedDate);
              }),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: ticketController.filteredTrains.length,
              itemBuilder: (context, index) {
                final ticket = ticketController.filteredTrains[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 5),
                  child: TicketWidget(
                    width: double.infinity,
                    height: 210.h,
                    isCornerRounded: true,
                    padding: const EdgeInsets.all(20),
                    child: TicketItem(ticket: ticket),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }}),
      ),
    );
  }
}

Widget _buildDateButton(String date, String day,
    TicketController ticketController, RxString selectedDate) {
  final DateTime dateTime =
      DateTime.parse('2023-10-$date'); // Use proper parsing
  bool isSelected = selectedDate.value ==
      dateTime.toIso8601String(); // Compare using ISO format
  return GestureDetector(
    onTap: () {
      selectedDate.value = dateTime.toIso8601String(); // Set selected date
      ticketController.filterTicketsByDate(
          selectedDate.value); // Filter tickets by selected date
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF075E63) : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              day,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCityInfo(String code, String city) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        code,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      Text(
        city,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

Widget _buildInfoText(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 4.0),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
