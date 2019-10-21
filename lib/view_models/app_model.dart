import 'dart:io';

import 'package:flutter_template/models/app_update_info.dart';
import 'package:flutter_template/core/services/app_service.dart';
import 'package:flutter_template/core/view_models/view_model.dart';

class AppUpdateModel extends ViewModel {
  AppUpdateInfo appUpdateInfo;
  Future<AppUpdateInfo> checkUpdate() async {
    setBusy();
    try {
      var appVersion = '0.1.11+1';
      appUpdateInfo =
          await AppService.checkUpdate(Platform.operatingSystem, appVersion);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
    return appUpdateInfo;
  }
}
