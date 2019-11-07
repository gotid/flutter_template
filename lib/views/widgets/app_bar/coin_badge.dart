import 'package:flutter_template/views/widgets/app_bar/stat_badge.dart';

class CoinBadge extends StatBadate<num> {
  CoinBadge(num statValue)
      : super(
          '积分',
          statValue,
          flare: 'assets/flare/Coin.flr',
        );

  @override
  num get celebrateAfter => 5;
}
