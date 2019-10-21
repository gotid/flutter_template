import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'list_view_model.dart';

/// 多页列表视图模型
///
/// 用于维护多页列表数据及状态，并提供下拉刷新、上拉加载方法
abstract class RefreshListViewModel<T> extends ListViewModel<T> {
  /// 首页页码
  static const int firstPage = 0;

  /// 单页条数
  static const int pageSize = 20;

  /// 当前页码
  int _currentPage = 0;

  /// 刷新控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  /// 下拉刷新
  ///
  /// [init] 是否第一次加载
  /// true: Error 时跳转页码
  /// false: Error 时直接出提示
  @override
  Future<List<T>> refresh({bool init = false}) async {
    try {
      _currentPage = firstPage;
      var data = await loadData(page: firstPage);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        setEmpty();
      } else {
        onDataLoaded(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        setIdle();
      }
      return data;
    } catch (e, s) {
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      return null;
    }
  }

  /// 加载更多
  Future<List<T>> loadMore() async {
    try {
      var data = await loadData(page: ++_currentPage);
      if (data.isEmpty) {
        _currentPage--;
        refreshController.loadNoData();
      } else {
        onDataLoaded(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _currentPage--;
      refreshController.loadFailed();
      setError(e, s);
      return null;
    }
  }

  /// 加载数据
  Future<List<T>> loadData({int page});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
