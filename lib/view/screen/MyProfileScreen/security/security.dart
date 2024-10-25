import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/security_controller.dart';

class SecurityScreen extends StatelessWidget {
  final SecurityController controller = Get.put(SecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Security',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 230,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              ListTile(
                title: Text('Face ID'),
                trailing: Obx(() => Switch(
                   // activeColor: Color(0xff005667),
                  activeTrackColor: Color(0xff005667),
                  value: controller.isFaceIdEnabled.value,
                  onChanged: (bool value) {
                    controller.toggleFaceId(value);
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(),
              ),
              ListTile(
                title: Text('Remember Password'),
                trailing: Obx(() => Switch(
                  activeTrackColor: Color(0xff005667),
                  value: controller.isRememberPasswordEnabled.value,
                  onChanged: (bool value) {
                    controller.toggleRememberPassword(value);
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(),
              ),
              ListTile(
                title: Text('Touch ID'),
                trailing: Obx(() => Switch(
                  activeTrackColor: Color(0xff005667),
                  value: controller.isTouchIdEnabled.value,
                  onChanged: (bool value) {
                    controller.toggleTouchId(value);
                  },
                )),
              ),
            ],
          )
        ),
      ),
    );
  }
}
