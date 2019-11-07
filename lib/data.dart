
Stream<int> promotions = Stream.periodic(Duration(seconds: 1), (int count) => count).asBroadcastStream();