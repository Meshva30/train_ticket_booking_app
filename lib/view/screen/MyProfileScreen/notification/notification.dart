import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/notification_controller.dart';

class NotificationSettingsScreen extends StatelessWidget {
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Add action for more options
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 308,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Obx(() => _buildSwitchTile(
                  'Payment', notificationController.isPaymentEnabled.value, (value) {
                notificationController.isPaymentEnabled.value = value;
              })),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(),
              ),
              Obx(() => _buildSwitchTile(
                  'Schedule', notificationController.isScheduleEnabled.value, (value) {
                notificationController.isScheduleEnabled.value = value;
              })),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(),
              ),
              Obx(() => _buildSwitchTile(
                  'Cancellation', notificationController.isCancellationEnabled.value, (value) {
                notificationController.isCancellationEnabled.value = value;
              })),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(),
              ),
              Obx(() => _buildSwitchTile(
                  'Notification', notificationController.isNotificationEnabled.value, (value) {
                notificationController.isNotificationEnabled.value = value;
              })),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeTrackColor: Color(0xff005667),
    );
  }
}
