import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/supplier_controller.dart';

class SupplierView extends GetView<SupplierController> {
  final umumC = Get.find<UmumController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Supplier"),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.INPUT_SUPPLIER);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
            ),
            GestureDetector(
              onTap: () {
                umumC.getAllSupplier();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.refresh)),
            ),
          ],
        ),
        body: FutureBuilder(
          future: umumC.getAllSupplier(),
          builder: (context, snapshot) {
            return Obx(
              () => Center(
                  child: ListView.builder(
                itemCount: umumC.listSupllier.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data Supplier ID Ke ${umumC.listSupllier[index].idSupplier!}",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Supplier",
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Tanggal"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Nomor Polisi"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("ID Supir"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Nomor Telepon"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(umumC.listSupllier[index].nama!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listSupllier[index].tanggal!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listSupllier[index].nomorPolisi!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listSupllier[index].idSupir!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listSupllier[index].telp!),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Hapus Data Supplier'),
                                    content: Text(
                                        'Yakin Hapus Data Supplier ID=${umumC.listSupllier[index].idSupplier}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          umumC
                                              .deleteSupplier(int.parse(umumC
                                                  .listSupllier[index]
                                                  .idSupplier!))
                                              .then((value) => umumC
                                                  .getAllSupplier()
                                                  .then((value) => Get.back()));
                                          // Get.back();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            );
          },
        ));
  }
}
