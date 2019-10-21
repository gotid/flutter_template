import 'package:flutter_template/core/services/wan_android_service.dart';
import 'package:flutter_template/core/view_models/list_view_model.dart';

class CategoryModel extends ListViewModel {
  @override
  Future<List> loadData() async {
    return await WanAndroidService.fetchTreeCategories();
  }
}
