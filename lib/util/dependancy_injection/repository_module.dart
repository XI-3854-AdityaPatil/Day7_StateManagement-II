import 'package:day7_demo/data/repository/login_repository_impl.dart';
import 'package:day7_demo/domain/repository/login_repository.dart';

import 'service_locator.dart';

Future setupRepositories() async {
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      locator.get(),
    ),
  );
}
