import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../controllers/input_supplier_controller.dart';

class InputSupplierView extends GetView<InputSupplierController> {
  @override
  Widget build(BuildContext context) {
    final umumC = Get.find<UmumController>();

    var selectedDate = DateTime.now().obs;
    var showTgl = false.obs;
    _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate) {
        selectedDate.value = picked;
        showTgl.value = true;
      }
      print(selectedDate);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Data Supplier'),
          actions: [
            GestureDetector(
              onTap: () {
                umumC.AddSupplier(controller.supirC.text, controller.telpC.text,
                    controller.nopolisiC.text, selectedDate.value);
                umumC.getAllSupplier();
                Get.back();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.add_box)),
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.supirC,
                      decoration: InputDecoration(
                          hintText: "Input Nama Supir",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.telpC,
                      decoration: InputDecoration(
                          hintText: "Input No Telepon",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.nopolisiC,
                      decoration: InputDecoration(
                          hintText: "Input Nomor Polisi",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        width: 200,
                        child: Center(child: Text("Choise Tanggal")),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => showTgl.isTrue
                          ? Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tanggal :"),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(selectedDate.toString()),
                                ],
                              ),
                            )
                          : SizedBox(),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
