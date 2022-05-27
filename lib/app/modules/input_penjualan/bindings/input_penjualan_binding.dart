import 'package:get/get.dart';

import '../controllers/input_penjualan_controller.dart';

class InputPenjualanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputPenjualanController>(
      () => InputPenjualanController(),
    );
  }
}
