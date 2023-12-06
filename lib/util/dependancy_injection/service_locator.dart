import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/connectivity_manager.dart';
import '../network/connectivity_presenter.dart';
import '../network/network_manager.dart' as network_manager;
import 'bloc_module.dart' as block_module;
import 'endpoint_module.dart' as endpoints;
import 'repository_module.dart' as repositories;

GetIt locator = GetIt.instance;

Future configurePreRequisites({required Function() completion}) async {
  _setConnectivityManager();
  _setupDefaultDio();
  block_module.setUpBloc();
  repositories.setupRepositories();
  endpoints.setupEndpoints();

  completion();
}

void _setupDefaultDio() {
  locator.registerLazySingleton<Dio>(
      () => network_manager.initialiseDefaultDio(),
      instanceName: 'DefaultRestClient');
}

void _setConnectivityManager() {
  locator.registerSingleton<ConnectivityPresenter>(
      ConnectivityPresenter.fromDelay(1000));

  locator.registerLazySingleton<ConnectivityManager>(
      () => ConnectivityManager(locator.get()));
}
