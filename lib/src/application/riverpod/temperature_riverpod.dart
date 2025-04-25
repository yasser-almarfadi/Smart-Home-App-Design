import 'package:flutter_riverpod/flutter_riverpod.dart';

final temperatureProvider = StateProvider<double>(
  (ref) => 22,
);
