import 'package:get_it/get_it.dart';

import 'services/api.dart';
import 'models/CRUDModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('polls'));
  locator.registerLazySingleton(() => CRUDModel());
}
