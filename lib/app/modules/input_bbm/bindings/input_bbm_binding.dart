import 'package:get/get.dart';

import '../controllers/input_bbm_controller.dart';

class InputBbmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputBbmController>(
      () => InputBbmController(),
    );
  }
}
