import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pertashop/app/data/models/bbm_model.dart';

import '../../../controllers/umum_controller.dart';
import '../controllers/input_bbm_controller.dart';

class InputBbmView extends GetView<InputBbmController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
    var id;
    if (umumC.isUpdatedBBM.isTrue) {
      Bbm bbm = Get.arguments;
      id = bbm.idJenis;
      controller.nameC.text = bbm.namaBbm.toString();
      controller.hargaC.text = bbm.hargaJual.toString();
      controller.stokC.text = bbm.stok.toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
              umumC.isUpdatedBBM.isFalse ? 'Input BBM Baru' : 'UPDATE BBM'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameC,
                decoration: InputDecoration(
                    hintText: "Input Nama BBM", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.hargaC,
                decoration: InputDecoration(
                    hintText: "Input Harga Jual", border: OutlineInputBorder()),
              ),
              umumC.isUpdatedBBM.isTrue
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: controller.stokC,
                            decoration: InputDecoration(
                                hintText: "Input Stok",
                                border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  umumC.isUpdatedBBM.isFalse
                      ? umumC.AddBBM(
                              controller.nameC.text, controller.hargaC.text)
                          .then((value) =>
                              umumC.getAllBBm().then((value) => Get.back()))
                      : umumC.UpdateBBM(id, controller.stokC.text,
                              controller.nameC.text, controller.hargaC.text)
                          .then((value) =>
                              umumC.getAllBBm().then((value) => Get.back()));
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    umumC.isUpdatedBBM.isFalse ? "Input Data" : "UPDATE",
                    style: TextStyle(color: Colors.white),
                  )),
                  width: double.infinity,
                ),
              )
            ],
          ),
        ));
  }
}
