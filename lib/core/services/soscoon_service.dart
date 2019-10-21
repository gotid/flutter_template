import 'package:flutter_template/core/api/soscoon_api.dart';
import 'package:flutter_template/models/common_data.dart';

class SoscoonService {
  static getRecommendBooks() async {
    var response = await http.get('api/book_info/recommend',
        queryParameters: {'index': 1, 'size': 5});
    return response.data['data']['data']
        .map<CommonData>((item) => CommonData.fromMap(item))
        .toList();
  }
}
