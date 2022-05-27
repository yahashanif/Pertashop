import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/bbm_controller.dart';

class BbmView extends GetView<BbmController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List BBM'),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                umumC.isUpdatedBBM.value = false;
                Get.toNamed(Routes.INPUT_BBM);
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20), child: Icon(Icons.add)),
            ),
            GestureDetector(
              onTap: () {
                umumC.getAllBBm();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.refresh)),
            ),
          ],
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: FutureBuilder(
              future: umumC.getAllBBm(),
              builder: (context, snapshot) {
                return Obx(
                  () => Wrap(
                    children: umumC.listBBM
                        .map(
                          (e) => Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            height: 250,
                            width:
                                (MediaQuery.of(context).size.width / 2) - (40),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nama BBM",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Container(
                                            height: 2,
                                            color: Colors.blue,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                (40),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(e.namaBbm.toString())
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Stok BBM",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Container(
                                            height: 2,
                                            color: Colors.blue,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                (40),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(e.stok.toString())
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Harga Jual",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          Container(
                                            height: 2,
                                            color: Colors.blue,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                (40),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Rp. " + e.hargaJual.toString())
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              umumC.isUpdatedBBM.value = true;
                                              Get.toNamed(Routes.INPUT_BBM,arguments: e);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.amber),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.mode_edit_sharp,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: const Text(
                                                      'Hapus Data BBM'),
                                                  content: Text(
                                                      'Yakin Hapus Data BBM ID=${e.idJenis}'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        umumC
                                                            .deleteBBM(
                                                                int.parse(e
                                                                    .idJenis
                                                                    .toString()))
                                                            .then((value) => umumC
                                                                .getAllBBm()
                                                                .then((value) =>
                                                                    Get.back()));
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.all(10),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )));
  }
}
