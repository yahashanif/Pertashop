import 'package:get/get.dart';
import 'package:pertashop/SplashScreen.dart';

import 'package:pertashop/app/modules/bbm/bindings/bbm_binding.dart';
import 'package:pertashop/app/modules/bbm/views/bbm_view.dart';
import 'package:pertashop/app/modules/home/bindings/home_binding.dart';
import 'package:pertashop/app/modules/home/views/home_view.dart';
import 'package:pertashop/app/modules/input_bbm/bindings/input_bbm_binding.dart';
import 'package:pertashop/app/modules/input_bbm/views/input_bbm_view.dart';
import 'package:pertashop/app/modules/input_penjualan/bindings/input_penjualan_binding.dart';
import 'package:pertashop/app/modules/input_penjualan/views/input_penjualan_view.dart';
import 'package:pertashop/app/modules/input_stok/bindings/input_stok_binding.dart';
import 'package:pertashop/app/modules/input_stok/views/input_stok_view.dart';
import 'package:pertashop/app/modules/input_supplier/bindings/input_supplier_binding.dart';
import 'package:pertashop/app/modules/input_supplier/views/input_supplier_view.dart';
import 'package:pertashop/app/modules/penjualan/bindings/penjualan_binding.dart';
import 'package:pertashop/app/modules/penjualan/views/penjualan_view.dart';
import 'package:pertashop/app/modules/stok/bindings/stok_binding.dart';
import 'package:pertashop/app/modules/stok/views/stok_view.dart';
import 'package:pertashop/app/modules/supplier/bindings/supplier_binding.dart';
import 'package:pertashop/app/modules/supplier/views/supplier_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUPPLIER,
      page: () => SupplierView(),
      binding: SupplierBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_SUPPLIER,
      page: () => InputSupplierView(),
      binding: InputSupplierBinding(),
    ),
    GetPage(
      name: _Paths.BBM,
      page: () => BbmView(),
      binding: BbmBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_BBM,
      page: () => InputBbmView(),
      binding: InputBbmBinding(),
    ),
    GetPage(
      name: _Paths.STOK,
      page: () => StokView(),
      binding: StokBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_STOK,
      page: () => InputStokView(),
      binding: InputStokBinding(),
    ),
    GetPage(
      name: _Paths.PENJUALAN,
      page: () => PenjualanView(),
      binding: PenjualanBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_PENJUALAN,
      page: () => InputPenjualanView(),
      binding: InputPenjualanBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
  ];
}
