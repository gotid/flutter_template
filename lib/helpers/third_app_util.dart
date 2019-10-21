import 'package:url_launcher/url_launcher.dart';

class ThirdAppUtil {
  static Future<String> canOpenApp(url) async {
    Uri uri = Uri.parse(url);
    String schema;
    switch (uri.host) {
      case 'www.jianshu.com':
        schema = 'jianshu://${uri.pathSegments.join("/")}';
        break;
      default:
        break;
    }
    if (await canLaunch(schema)) {
      return schema;
    } else {
      throw '无法打开第三方 APP';
    }
  }

  static openAppByUrl(url) async {
    await launch(url);
  }
}
