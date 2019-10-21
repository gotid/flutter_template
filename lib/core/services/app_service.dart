import 'package:flutter_template/core/api/pgyer_api.dart';
import 'package:flutter_template/models/app_update_info.dart';

class AppService {
  static Future<AppUpdateInfo> checkUpdate(
      String platform, String version) async {
    var response = await http.post(
      'app/check',
      queryParameters: {'buildVersion': version},
    );
    return AppUpdateInfo.fromMap(response.data);
  }
}
