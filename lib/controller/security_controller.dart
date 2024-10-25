import 'package:get/get.dart';

class SecurityController extends GetxController {
  var isFaceIdEnabled = true.obs;
  var isRememberPasswordEnabled = true.obs;
  var isTouchIdEnabled = true.obs;

  // Methods to toggle the switches
  void toggleFaceId(bool value) {
    isFaceIdEnabled.value = value;
  }

  void toggleRememberPassword(bool value) {
    isRememberPasswordEnabled.value = value;
  }

  void toggleTouchId(bool value) {
    isTouchIdEnabled.value = value;
  }


}
