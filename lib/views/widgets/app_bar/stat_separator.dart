import 'package:flutter/material.dart';

import '../../../style.dart';

/// 放置在统计徽章 [StatBadge] 中间以清晰区分它们的小部件
class StatSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      color: statSeperatorColor,
    );
  }
}
