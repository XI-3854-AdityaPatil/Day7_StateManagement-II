import 'package:day7_demo/data/endpoint/auth_endpoint.dart';

import 'service_locator.dart';

void setupEndpoints() {
  locator.registerFactory(
    () => AuthEndpoint(
      locator.get(instanceName: 'DefaultRestClient'),
    ),
  );
}
