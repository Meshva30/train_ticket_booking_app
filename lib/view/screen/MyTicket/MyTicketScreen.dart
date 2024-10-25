import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff005667),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'My Ticket',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Let\'s find something',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  container_box('All'),
                  container_box('Lenia Express'),
                  container_box('Jelingga Train'),
                ],
              ),
            ),
            SizedBox(height: 16),
            TabBar(
              indicatorColor: Color(0xff005667),
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Done'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container container_box(String text) {
    return Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                );
  }
}
