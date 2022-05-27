import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/stok_controller.dart';

class StokView extends GetView<StokController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Stok"),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.INPUT_STOK);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
            ),
            GestureDetector(
              onTap: () {
                umumC.getAllStok();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.refresh)),
            ),
          ],
        ),
        body: FutureBuilder(
          future: umumC.getAllStok(),
          builder: (context, snapshot) {
            return Obx(
              () => Center(
                  child: ListView.builder(
                itemCount: umumC.listStok.length,
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
                        "ID Pembelian #${umumC.listStok[index].idPembelian!}",
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
                                    "Tanggal",
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Jumlah Pemesanan"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Harga"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Nama BBM"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Nama"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(umumC.listStok[index].tanggal!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listStok[index].jumlahPemesanan!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listStok[index].harga!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listStok[index].namaBbm!),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(umumC.listStok[index].nama!),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
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
                                              .deleteStok(int.parse(umumC
                                                  .listStok[index]
                                                  .idPembelian!))
                                              .then((value) => umumC
                                                  .getAllStok()
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
