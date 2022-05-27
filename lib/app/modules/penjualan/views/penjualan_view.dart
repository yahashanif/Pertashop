import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/penjualan_controller.dart';

class PenjualanView extends GetView<PenjualanController> {
  final umumC = Get.find<UmumController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Penjualan"),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.INPUT_PENJUALAN);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
            ),
            GestureDetector(
              onTap: () {
                umumC.getAllPenjualan();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.refresh)),
            ),
          ],
        ),
        body: FutureBuilder(
          future: umumC.getAllPenjualan(),
          builder: (context, snapshot) {
            return Obx(
              () => Center(
                  child: ListView.builder(
                itemCount: umumC.listPenjualan.length,
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
                        "ID Penjualan #${umumC.listPenjualan[index].idPenjualan!}",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tanggal"),
                          Text(umumC.listPenjualan[index].tanggal!),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sonding"),
                          Text(umumC.listPenjualan[index].sonding!),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Speed Awal"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(umumC.listPenjualan[index].speedAwal!),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Speed Akhir"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(umumC.listPenjualan[index].speedAkhir!),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Penjualan"),
                          Text(umumC.listPenjualan[index].penjualan!),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Penjualan"),
                          Text(umumC.listPenjualan[index].totalPenjualan!),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Hapus Data Stok'),
                            content: Text(
                                'Yakin Hapus Data Stok ID PEMBELIAN=${umumC.listStok[index].idPembelian}'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  umumC
                                      .deletePenjualan(int.parse(umumC
                                          .listPenjualan[index].idPenjualan!))
                                      .then((value) => umumC.getAllPenjualan());
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text(
                              "Remove",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          },
        ));
  }
}
