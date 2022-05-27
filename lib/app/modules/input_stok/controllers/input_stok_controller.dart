import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputStokController extends GetxController {
  late TextEditingController jumlahPC;
  late TextEditingController hargaC;
 

  @override
  void onInit() {
    jumlahPC = TextEditingController();
    hargaC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    jumlahPC.dispose();
    hargaC.dispose();
    super.dispose();
  }
}
