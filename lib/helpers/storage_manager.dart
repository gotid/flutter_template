import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageManager {
  /// 临时目录，用于 cookie 等临时数据
  static Directory temporaryDirectory;

  static init() async => temporaryDirectory = await getTemporaryDirectory();
}
