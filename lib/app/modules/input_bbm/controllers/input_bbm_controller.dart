import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBbmController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController hargaC;
  late TextEditingController stokC;

  @override
  void onInit() {
    nameC = TextEditingController();
    hargaC = TextEditingController();
    stokC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameC.dispose();
    hargaC.dispose();
    stokC.dispose();
    super.dispose();
  }
}
