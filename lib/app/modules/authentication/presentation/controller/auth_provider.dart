import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/network_service/api_service.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/core/services/registry_service/di.dart';
import 'package:login_api/app/core/services/routing_service/app_routes.dart';
import 'package:login_api/app/core/services/routing_service/named_routes.dart';
import 'package:login_api/app/core/utils/buffers.dart';
import 'package:login_api/app/modules/authentication/data/dto/login_dto.dart';
import 'package:login_api/app/modules/authentication/data/source/auth_imple_repo.dart';
import 'package:login_api/app/modules/authentication/domain/entities/login_entity.dart';
import 'package:login_api/app/modules/authentication/domain/usecase/login_usecase.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider(),
);

class AuthProvider extends ChangeNotifier with Buffers {
  final LoginUsecase _loginUsecase = LoginUsecase(
    locator<AuthImpleRepo>(),
  );

  LoginDto? loginDto;

  Future<void> login(LoginEntity entity) async {
    await executeAPI(
      apiEndPoint: ApiRoutes.login,
      onExecute: () async {
        loginDto = await _loginUsecase.execute(entity);
        AuthHandler.ref.setupUser(loginDto?.user, true);
        AuthHandler.ref.storeToken(loginDto?.user.token, true);
        AppRouterGo.pushReplacement(homeScreen);
      },
      
    );
  }
}
