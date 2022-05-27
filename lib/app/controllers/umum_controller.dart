import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pertashop/app/data/models/bbm_model.dart';
import 'package:pertashop/app/data/models/penjualan_model.dart';
import 'package:pertashop/app/data/models/stok_model.dart';
import 'package:pertashop/app/data/models/supplier_model.dart';
import 'package:http/http.dart' as http;

class UmumController extends GetxController {
  var listSupllier = <Supplier>[].obs;
  var listBBM = <Bbm>[].obs;
  var listStok = <Stok>[].obs;
  var listPenjualan = <Penjualan>[].obs;
  var isUpdatedBBM = false.obs;

  String baseUrl = "http://10.234.219.217/rest-api-pertashop";

  Future<void> getAllSupplier() async {
    listSupllier.clear();
    String url = baseUrl + "/supplier/list_supplier.php";
    final response = await http.get(Uri.parse(url));
    List data = convert.jsonDecode(response.body);
    print(data);
    List<Supplier> _supplier =
        data.map((data) => Supplier.fromJson(data)).toList();

    _supplier.map((e) {
      listSupllier.add(e);
      listSupllier.refresh();
    }).toList();
  }

  Future<void> deleteSupplier(int id) async {
    String url = baseUrl + "/supplier/delete_supplier.php";
    final response = await http.delete(
      Uri.parse(url),
      body: "id=${id}",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );
    print(response.body);
  }

  Future<void> AddSupplier(
      String supir, String telp, String nopolisi, DateTime tgl) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(tgl);
    String url = baseUrl + "/supplier/add_supplier.php";
    Map<String, String> body = {
      'supir': supir,
      'telp': telp,
      'nomor_polisi': nopolisi,
      'tanggal': formattedDate,
    };
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );

    print(response.body);
  }

  Future<void> getAllBBm() async {
    listBBM.clear();
    String url = baseUrl + "/0menu-setting/bbm/list_bbm.php";
    final response = await http.get(Uri.parse(url));
    List data = convert.jsonDecode(response.body);
    print(data);
    List<Bbm> _bbm = data.map((data) => Bbm.fromJson(data)).toList();

    _bbm.map((e) {
      listBBM.add(e);
      listBBM.refresh();
    }).toList();
  }

  Future<void> deleteBBM(int id) async {
    String url = baseUrl + "/0menu-setting/bbm/delete_bbm.php";
    final response = await http.delete(
      Uri.parse(url),
      body: "id=${id}",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );
    print(response.body);
  }

  Future<void> AddBBM(String name, String harga) async {
    String url = baseUrl + "/0menu-setting/bbm/add_bbm.php";
    Map<String, String> body = {
      'subsidi': name,
      'harga_jual': harga,
    };
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );

    print(response.body);
  }

  Future<void> UpdateBBM(
      String id, String stok, String name, String harga) async {
    String url = baseUrl + "/0menu-setting/bbm/update_bbm.php";
    Map<String, String> body = {
      'id': id,
      'nama_bbm': name,
      'stok': stok,
      'harga_jual': harga,
    };
    final response = await http.put(
      Uri.parse(url),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );

    print(response.body);
  }

  Future<void> getAllStok() async {
    listStok.clear();
    String url = baseUrl + "/update_stok/list_stok.php";
    final response = await http.get(Uri.parse(url));
    List data = convert.jsonDecode(response.body);
    print(data);
    List<Stok> _stok = data.map((data) => Stok.fromJson(data)).toList();

    _stok.map((e) {
      listStok.add(e);
      listStok.refresh();
    }).toList();
  }

  Future<void> deleteStok(int id) async {
    String url = baseUrl + "/update_stok/delete_stok.php";
    final response = await http.delete(
      Uri.parse(url),
      body: "id=${id}",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );
    print(response.body);
  }

  Future<void> AddStok(DateTime tgl, String jenisbbm, String jumlahpemesanan,
      String harga) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(tgl);
    String url = baseUrl + "/update_stok/add_stok.php";
    Map<String, String> body = {
      'tanggal': formattedDate,
      'jenis_bbm': jenisbbm,
      'jumlah_pemesanan': jumlahpemesanan,
      'harga': harga,
    };
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );

    print(response.body);
  }

  Future<void> getAllPenjualan() async {
    listPenjualan.clear();
    String url = baseUrl + "/penjualan/list_penjualan.php";
    final response = await http.get(Uri.parse(url));
    List data = convert.jsonDecode(response.body);
    print(data);
    List<Penjualan> _penjualan =
        data.map((data) => Penjualan.fromJson(data)).toList();

    _penjualan.map((e) {
      listPenjualan.add(e);
      listPenjualan.refresh();
    }).toList();
  }

  Future<void> deletePenjualan(int id) async {
    String url = baseUrl + "/penjualan/delete_penjualan.php";
    final response = await http.delete(
      Uri.parse(url),
      body: "id=${id}",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );
    print(response.body);
  }

  Future<void> AddPenjualan(DateTime tgl, String jenisbbm, String sonding,
      String speed_awal, String speed_akhir, String penjualan) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(tgl);
    String url = baseUrl + "/penjualan/add_penjualan.php";
    Map<String, String> body = {
      'tanggal': formattedDate,
      'jenis_bbm': jenisbbm,
      'sonding': sonding,
      'speed_awal': speed_awal,
      'speed_akhir': speed_akhir,
      'penjualan': penjualan,
    };
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: convert.Encoding.getByName("utf-8"),
    );

    print(response.body);
  }
}
