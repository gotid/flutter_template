import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_template/models/article.dart';
import 'package:flutter_template/view_models/article_model.dart';
import 'package:flutter_template/views/helpers/skeleton_helper.dart';
import 'package:flutter_template/views/helpers/view_model_helper.dart';
import 'package:flutter_template/views/widgets/article_list_item.dart';
import 'package:flutter_template/views/widgets/article_skeleton_item.dart';

class ArticleListPage extends StatefulWidget {
  // 分类编号
  final int cid;

  ArticleListPage(this.cid);

  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ViewModelWidget<ArticleListModel>(
      model: ArticleListModel(widget.cid),
      onModelReady: (model) => model.initData(),
      builder: (context, model, child) {
        if (model.isBusy) {
          // return ViewStateBusyWidget();
          return SkeletonList(builder: (_, __) => ArticleSkeletonItem());
        } else if (model.isError) {
          return ViewStateErrorWidget(
              error: model.viewStateError,
              message: model.errorMessage,
              onPressed: model.initData);
        } else if (model.isEmpty) {
          return ViewStateEmptyWidget(onPressed: model.initData);
        }

        return SmartRefresher(
          controller: model.refreshController,
          onRefresh: model.refresh,
          onLoading: model.loadMore,
          enablePullUp: true,
          // header: WaterDropHeader(),
          // footer: RefreshFooter(),
          child: ListView.builder(
            itemCount: model.list.length,
            itemBuilder: (context, index) {
              Article article = model.list[index];
              return ArticleListItem(article);
            },
          ),
        );
      },
    );
  }
}
