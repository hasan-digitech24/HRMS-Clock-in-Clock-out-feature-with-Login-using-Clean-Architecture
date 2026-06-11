import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/network_service/api_service.dart';
import 'package:login_api/app/core/services/network_service/entities/api_route_entity.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/core/utils/app_logger.dart';
import 'package:login_api/app/modules/attendance/data/dto/check_status_dto.dart';
import 'package:login_api/app/modules/attendance/data/dto/clock_in_dto.dart';
import 'package:login_api/app/modules/attendance/domain/entity/clock_in_entity.dart';
import 'package:login_api/app/modules/attendance/domain/repo/attendance_repo.dart';

class AttedanceImpleRepo implements AttendanceRepo {
  final ApiService _apiService;

  AttedanceImpleRepo(this._apiService);
  @override
  Future<ClockInDto> clockIn(ClockInEntity entity, int id) async {
    try {
      final response = await _apiService.requestPOST(
        apiRoute: ApiRouteEntity(
          base: ApiRoutes.baseUrl,
          endpoint: ApiRoutes.clockIn(id),
        ),
        headers: {"Content-Type": "application/json",
        "Authorization" : "Bearer ${AuthHandler.ref.user?.token ?? ''}"
        },
        data: entity.toJson(),
      );
      return clockInDtoFromJson(response);
    } catch (e) {
           appPrint("Clock-in Error: $e");
      rethrow;
    }
  }

  @override
  Future<CheckStatusDto> checkClockInClockOutStatus(int id)async {
    try {
      final response = await _apiService.requestGET(
        apiRoute: ApiRouteEntity(
          base: ApiRoutes.baseUrl,
          endpoint: ApiRoutes.checkStatus(id),
        ),
        headers: {"Content-Type": "application/json",
        "Authorization" : "Bearer ${AuthHandler.ref.user?.token ?? ''}"
        },
      );
      return checkStatusDtoFromJson(response);
    } catch (e) {
           appPrint("Check Status Error: $e");
      rethrow;
    }
  }

}
