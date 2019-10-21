import 'package:flutter/widgets.dart';

class UIHelper {
  static const double _verticalSpaceSmall = 10.0;
  static const double _verticalSpaceMedium = 20.0;
  static const double _verticalSpaceLarge = 60.0;

  static Widget verticalSpaceSmall = SizedBox(height: _verticalSpaceSmall);
  static Widget verticalSpaceLarge = SizedBox(height: _verticalSpaceLarge);
  static Widget verticalSpaceMedium = cYM(_verticalSpaceMedium);

  /// 自定义垂直间距
  static Widget cYM(double y) {
    return SizedBox(height: y);
  }

// 自定义水平间距
  static Widget cXM(double x) {
    return SizedBox(width: x);
  }
}
