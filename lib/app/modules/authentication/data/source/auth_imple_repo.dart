import 'package:login_api/app/core/services/network_service/api_service.dart';
import 'package:login_api/app/core/services/network_service/entities/api_route_entity.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/core/utils/app_logger.dart';
import 'package:login_api/app/modules/authentication/data/dto/login_dto.dart';
import 'package:login_api/app/modules/authentication/domain/entities/login_entity.dart';
import 'package:login_api/app/modules/authentication/domain/repo/auth_repo.dart';

class AuthImpleRepo implements AuthRepo {
  final ApiService _apiService;
  AuthImpleRepo(this._apiService);
  @override
  Future<LoginDto> login(LoginEntity entity) async {
    try {
      final response = await _apiService.requestPOST(
        apiRoute: ApiRouteEntity(
          base: ApiRoutes.baseUrl,
          endpoint: ApiRoutes.login,
        ),
        data: entity.toJson(),
        headers: {"Content-Type": "application/json"},
        
      );
      return loginDtoFromJson(response);
    } catch (e) {
      appPrint("Login Error: $e");
      rethrow;
    }
  }
}
