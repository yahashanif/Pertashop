import 'package:get/get.dart';

import '../models/bbm_model.dart';

class BbmProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Bbm.fromJson(map);
      if (map is List) return map.map((item) => Bbm.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Bbm?> getBbm(int id) async {
    final response = await get('bbm/$id');
    return response.body;
  }

  Future<Response<Bbm>> postBbm(Bbm bbm) async => await post('bbm', bbm);
  Future<Response> deleteBbm(int id) async => await delete('bbm/$id');
}
