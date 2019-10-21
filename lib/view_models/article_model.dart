import 'package:flutter_template/core/services/wan_android_service.dart';
import 'package:flutter_template/core/view_models/page_view_model.dart';

class ArticleListModel extends PageViewModel {
  final int cid;

  ArticleListModel(this.cid);

  @override
  Future<List> loadData({int page}) async {
    return WanAndroidService.fetchArticleList(page, cid: cid);
  }

  @override
  onDataLoaded(List data) {
    // TODO: 刷新全局收藏状态，Fun or Mobx?
    return super.onDataLoaded(data);
  }
}
