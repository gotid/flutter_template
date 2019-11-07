import 'package:flutter_template/views/widgets/app_bar/stat_badge.dart';

class UsersBadge extends StatBadate<num> {
  UsersBadge(num statValue)
      : super(
          '客户',
          statValue,
          flare: 'assets/flare/Users.flr',
        );

  @override
  num get celebrateAfter => 100;
}
