import 'view_model.dart';

/// 单页列表视图模型
///
/// 用于维护单页列表数据及状态
abstract class ListViewModel<T> extends ViewModel {
  /// 列表数据
  List<T> list = [];

  /// 第一次进入视图
  initData() async {
    setBusy();
    await refresh(init: true);
  }

  /// 刷新数据
  refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      if (data.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onDataLoaded(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  /// 加载数据
  Future<List<T>> loadData();

  /// 数据加载完毕回调函数
  onDataLoaded(List<T> data) {}
}
