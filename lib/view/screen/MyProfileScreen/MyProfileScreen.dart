import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_booking_app/view/screen/MyProfileScreen/changepassword/changepassword.dart';
import 'package:train_ticket_booking_app/view/screen/MyProfileScreen/edit/edit_screen.dart';
import 'package:train_ticket_booking_app/view/screen/MyProfileScreen/security/security.dart';

import 'HelpSupport/HelpSupport.dart';
import 'LanguageSelection/LanguageSelection.dart';
import 'legal_policies/legal_policies.dart';
import 'notification/notification.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'General',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(
                'Edit Profile',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(EditProfileScreen());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text(
                'Change Password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(ChangePasswordScreen());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(NotificationSettingsScreen());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.security_outlined),
              title: Text(
                'Security',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(SecurityScreen());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Text('English'),
              onTap: () {
                Get.to(LanguageSelectionPage());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Preferences',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text(
                'Legal and Policies',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(LegalPoliciesPage());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                'Help & Support',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Get.to(HelpSupportPage());
              },
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 28,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Are you sure you want to logout?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xff005667),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text('Log Out',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          )
        ]));
  }
}
