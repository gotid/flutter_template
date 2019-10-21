import 'package:flutter_template/core/api/wan_android_api.dart';
import 'package:flutter_template/models/article.dart';
import 'package:flutter_template/models/tree.dart';

class WanAndroidService {
  /// 获取项目分类
  static Future<List> fetchTreeCategories() async {
    var response = await http.get('tree/json');
    return response.data.map<Tree>((item) => Tree.fromMap(item)).toList();
  }

  /// 获取文章列表
  static Future<List> fetchArticleList(int page, {int cid}) async {
    var response = await http.get(
      'article/list/$page/json',
      queryParameters: cid != null ? {'cid': cid} : null,
    );
    return response.data['datas']
        .map<Article>((item) => Article.fromMap(item))
        .toList();
  }
}
