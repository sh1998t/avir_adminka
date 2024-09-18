import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_container.config.dart';

///Command to generate container dependencies
/// flutter packages pub run build_runner build --delete-conflicting-outputs
final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi() async {
  await getIt.init();

  return getIt.allReady();
}

Future<void> disposeDi() {
  return getIt.reset();
}

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

// Manual registration (if you're not using injectable)

