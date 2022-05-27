import 'package:get/get.dart';

import '../models/penjualan_model.dart';

class PenjualanProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Penjualan.fromJson(map);
      if (map is List)
        return map.map((item) => Penjualan.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Penjualan?> getPenjualan(int id) async {
    final response = await get('penjualan/$id');
    return response.body;
  }

  Future<Response<Penjualan>> postPenjualan(Penjualan penjualan) async =>
      await post('penjualan', penjualan);
  Future<Response> deletePenjualan(int id) async =>
      await delete('penjualan/$id');
}
