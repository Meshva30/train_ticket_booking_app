import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/bottom_navigationbar.dart';
import '../Explore/ExploreScreen.dart';
import '../MyProfileScreen/MyProfileScreen.dart';
import '../MyTicket/MyTicketScreen.dart';
import 'home_screen.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());


  final List<Widget> screens = [
    HomeScreen(key: PageStorageKey('HomeScreen')),
    ExploreScreen(),
    MyTicketScreen(),
    SettingsScreen(), // Add a key here
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_outlined),
              label: 'My Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'My Profile',
            ),
          ],
          currentIndex: bottomNavController.selectedIndex.value,
          selectedItemColor: Color(0xff005667),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) => bottomNavController.updateIndex(index),
        ),
      ),
    );
  }
}
