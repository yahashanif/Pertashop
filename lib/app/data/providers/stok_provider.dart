import 'package:get/get.dart';

import '../models/stok_model.dart';

class StokProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Stok.fromJson(map);
      if (map is List) return map.map((item) => Stok.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Stok?> getStok(int id) async {
    final response = await get('stok/$id');
    return response.body;
  }

  Future<Response<Stok>> postStok(Stok stok) async => await post('stok', stok);
  Future<Response> deleteStok(int id) async => await delete('stok/$id');
}
