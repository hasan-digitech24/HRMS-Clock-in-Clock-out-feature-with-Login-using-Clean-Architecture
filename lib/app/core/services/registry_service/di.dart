import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/network_service/api_service.dart';
import 'package:login_api/app/core/services/secure_storage.dart';
import 'package:login_api/app/core/utils/app_logger.dart';
import 'package:login_api/app/modules/attendance/data/source/attendance_imple_repo.dart';
import 'package:login_api/app/modules/authentication/data/source/auth_imple_repo.dart';

final locator = GetIt.instance;

void setupLocator() {
  appPrint("***Setup Registry***");
  locator.registerLazySingleton<Prefs>(() => Prefs());
  locator.registerLazySingleton<Client>(() => Client());
  locator.registerLazySingleton<ApiService>(() => ApiService());
  // locator.registerLazySingleton<AuthHandler>(() => AuthHandler());
  // locator.registerLazySingleton<ImagePicker>(() => ImagePicker());

  locator.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        // encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions.defaultOptions,
    ),
  );
  // Auth Repo

  locator.registerFactory<AuthImpleRepo>(
    () => AuthImpleRepo(locator<ApiService>()),
  );

  locator.registerFactory<AttedanceImpleRepo>(
    () => AttedanceImpleRepo(locator<ApiService>()),
  );
 
}
