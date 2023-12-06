import 'package:day7_demo/domain/usecase/user_login_usecase.dart';
import 'package:day7_demo/presentation/login_cubit.dart';
import 'package:day7_demo/presentation/login_screen.dart';
import 'package:day7_demo/util/dependancy_injection/service_locator.dart'
    as injector;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'util/dependancy_injection/service_locator.dart';

Future<void> main() async {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); //Scenario: when app launches with deeplink
  await injector.configurePreRequisites(completion: () async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => LoginCubit(locator.get<LoginUsecase>()),
        child: const LoginScreen(),
      ),
    );
  }
}
