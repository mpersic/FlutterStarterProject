// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:flutter_starter_project/src/core/injectable/injectable.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<bool> configureDependencies() async {
  $initGetIt(sl);
  return true;
}

class Injector {
  static T locateService<T extends Object>({dynamic param1, dynamic param2}) =>
      GetIt.I.get<T>(param1: param1, param2: param2);
}
