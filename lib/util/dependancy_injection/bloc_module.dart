import 'package:day7_demo/domain/usecase/user_login_usecase.dart';
import 'package:day7_demo/presentation/login_cubit.dart';
import 'package:day7_demo/util/dependancy_injection/service_locator.dart';

Future<void> setUpBloc() async {
  _setUpLoginCubit();
}

void _setUpLoginCubit() {
  locator.registerFactory(
    () => LoginUsecase(locator.get()),
  );
  locator.registerFactory(() => LoginCubit(locator.get()));
}
