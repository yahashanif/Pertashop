import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Pertashop Jambi',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Center(
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.SUPPLIER);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: (MediaQuery.of(context).size.width / 2) - (44),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_rounded,
                            size: 75,
                          ),
                          Text("Supplier"),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.BBM);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: (MediaQuery.of(context).size.width / 2) - (44),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.energy_savings_leaf,
                            size: 75,
                          ),
                          Text("BBM"),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.STOK);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: (MediaQuery.of(context).size.width / 2) - (44),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.line_axis,
                            size: 75,
                          ),
                          Text("Stok"),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.PENJUALAN);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: (MediaQuery.of(context).size.width / 2) - (44),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sell_rounded,
                            size: 75,
                          ),
                          Text("Penjualan"),
                        ],
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ));
  }
}
