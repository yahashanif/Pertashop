import 'package:get/get.dart';

import '../controllers/input_supplier_controller.dart';

class InputSupplierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputSupplierController>(
      () => InputSupplierController(),
    );
  }
}
