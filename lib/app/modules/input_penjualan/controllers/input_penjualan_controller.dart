import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPenjualanController extends GetxController {
  late TextEditingController SondingC;
  late TextEditingController SpeedAwalC;
  late TextEditingController SpeedAkhirC;
  late TextEditingController PenjualanC;
 

  @override
  void onInit() {
    SondingC = TextEditingController();
    SpeedAwalC = TextEditingController();
    SpeedAkhirC = TextEditingController();
    PenjualanC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    SondingC.dispose();
    SpeedAwalC.dispose();
    SpeedAkhirC.dispose();
    PenjualanC.dispose();
    super.dispose();
  }
}
