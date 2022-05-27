import 'package:get/get.dart';

import '../controllers/input_stok_controller.dart';

class InputStokBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputStokController>(
      () => InputStokController(),
    );
  }
}
