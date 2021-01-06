import 'package:chatter_box/repository/local/local_provider.dart';
import 'package:chatter_box/repository/local/local_repository.dart';
import 'package:chatter_box/repository/server/server_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'config_reader.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize(env);
  // Load the JSON config into memory
  await LocalProvider.initialize(env);

  await Firebase.initializeApp();

  GetIt.I.registerLazySingleton(() => LocalRepository(env));
  GetIt.I.registerLazySingleton(
      () => ServerRepository(env, GetIt.I<LocalRepository>()));

  runApp(MyApp());
}
