import 'package:flutter_template/views/widgets/app_bar/stat_badge.dart';

class JoyBadge extends StatBadate<num> {
  JoyBadge(num statValue)
      : super(
          '满意度',
          statValue,
          flare: 'assets/flare/Joy.flr',
        );

  @override
  num get celebrateAfter => 0;
}
