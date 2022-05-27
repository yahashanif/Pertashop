import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../controllers/input_penjualan_controller.dart';

class InputPenjualanView extends GetView<InputPenjualanController> {
  @override
  Widget build(BuildContext context) {
    final umumC = Get.find<UmumController>();

    var selectedDate = DateTime.now().obs;
    var idbbm;
    var bbmname = "".obs;
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
          title: Text('Input Data Penjualan'),
          actions: [
            GestureDetector(
              onTap: () {
                umumC.AddPenjualan(
                        selectedDate.value,
                        idbbm,
                        controller.SondingC.text,
                        controller.SpeedAwalC.text,
                        controller.SpeedAkhirC.text,
                        controller.PenjualanC.text)
                    .then((value) =>
                        umumC.getAllPenjualan().then((value) => Get.back()));
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
          child: ListView(
            children: [
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
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('List Data BBM'),
                          content: FutureBuilder(
                              future: umumC.getAllBBm(),
                              builder: (context, snapshot) {
                                return Column(children: [
                                  ...umumC.listBBM
                                      .map(
                                        (element) => GestureDetector(
                                          onTap: () {
                                            idbbm = element.idJenis.toString();
                                            bbmname.value =
                                                element.namaBbm.toString();
                                            print(idbbm);
                                            Get.back();
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.blue[200]),
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              element.namaBbm.toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                ]);
                              }),
                        )),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(
                            bbmname.value == "" ? "Pilih BBM" : bbmname.value)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.SondingC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Sonding", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.SpeedAwalC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Speed Awal", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.SpeedAkhirC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Speed Akhir",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.PenjualanC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Penjualan", border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
