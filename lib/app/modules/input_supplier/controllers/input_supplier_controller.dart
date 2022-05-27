import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSupplierController extends GetxController {
   late TextEditingController supirC;
  late TextEditingController telpC;
  late TextEditingController nopolisiC;

  @override
  void onInit() {
    supirC = TextEditingController();
    telpC = TextEditingController();
    nopolisiC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    supirC.dispose();
    telpC.dispose();
    nopolisiC.dispose();
    super.dispose();
  }

}
