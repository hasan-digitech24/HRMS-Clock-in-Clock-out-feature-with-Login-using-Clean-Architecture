import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_api/app/core/exceptions/exceptions.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/location_service.dart/get_current_location.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/core/services/registry_service/di.dart';
import 'package:login_api/app/core/utils/app_logger.dart';
import 'package:login_api/app/core/utils/app_snack_bar.dart';
import 'package:login_api/app/core/utils/buffers.dart';
import 'package:login_api/app/modules/attendance/data/dto/check_status_dto.dart';
import 'package:login_api/app/modules/attendance/data/dto/clock_in_dto.dart';
import 'package:login_api/app/modules/attendance/data/source/attendance_imple_repo.dart';
import 'package:login_api/app/modules/attendance/domain/entity/clock_in_entity.dart';
import 'package:login_api/app/modules/attendance/domain/usecase/check_status_usecase.dart';
import 'package:login_api/app/modules/attendance/domain/usecase/clock_in_usecase.dart';

final attendanceProvider = ChangeNotifierProvider<AttendanceProvider>(
  (ref) => AttendanceProvider(),
);

class AttendanceProvider extends ChangeNotifier with Buffers {
  final ClockInUsecase _clockInUsecase = ClockInUsecase(
    locator<AttedanceImpleRepo>(),
  );

  final CheckStatusUsecase _checkStatusUsecase = CheckStatusUsecase(
    locator<AttedanceImpleRepo>(),
  );

  ClockInDto? clockInDto;
  CheckStatusDto? checkStatusDto;

  Position? position;

  Future<void> clockIn(ClockInEntity entity, int id) async {
    await executeAPI(
      apiEndPoint: ApiRoutes.clockIn(1),
      onExecute: () async {
        try {
          // Ask for location first
          position = await LocationService.getCurrentLocation();
          await validateOfficeRange(position);

          // appPrint('Latitude: ${position?.latitude}');
          // appPrint('Longitude: ${position?.longitude}');

          final userId = AuthHandler.ref.user?.userId ?? 0;

          clockInDto = await _clockInUsecase.execute(entity, userId);

          await checkClockInClockOutStatus();

          Prompt.showSuccess('Clock-in successful');
        } on OfficeRangeException catch (e) {
          Prompt.showError(e.message);
        } on LocationServiceException catch (e) {
          Prompt.showErrorDialog(
            e.message,
            title: 'Location Service Disabled',
            buttonTitle: 'Open Location',
            onTap: () {
              Geolocator.openLocationSettings();
            },
          );
        } on LocationPermissionException catch (e) {
          Prompt.showErrorDialog(
            e.message,
            title: 'Permission Required',
            buttonTitle: 'Open App Settings',
            onTap: () {
              Geolocator.openAppSettings();
            },
          );
        } catch (e) {
          Prompt.show(e.toString());
        }
      },
    );
  }

  Future<void> clockOut(ClockInEntity entity, int id) async {
    await executeAPI(
      apiEndPoint: ApiRoutes.clockIn(2),
      onExecute: () async {
        try {
          position = await LocationService.getCurrentLocation();
          await validateOfficeRange(position);

          // appPrint('Latitude: ${position?.latitude}');
          // appPrint('Longitude: ${position?.longitude}');

          final userId = AuthHandler.ref.user?.userId ?? 0;

          clockInDto = await _clockInUsecase.execute(entity, userId);

          await checkClockInClockOutStatus();

          Prompt.showSuccess('Clock-out successful');
        } on OfficeRangeException catch (e) {
          Prompt.show(e.message);
        } on LocationServiceException catch (e) {
          Prompt.showErrorDialog(
            e.message,
            title: 'Location Service Disabled',
            buttonTitle: 'Open Location',
            onTap: () {
              Geolocator.openLocationSettings();
            },
          );
        } on LocationPermissionException catch (e) {
          Prompt.showErrorDialog(
            e.message,
            title: 'Permission Required',
            buttonTitle: 'Open App Settings',
            onTap: () {
              Geolocator.openAppSettings();
            },
          );
        } catch (e) {
          Prompt.show(e.toString());
        }
      },
    );
  }

  Future<void> checkClockInClockOutStatus() async {
    await executeAPI(
      apiEndPoint: ApiRoutes.checkStatus(1),
      onExecute: () async {
        final userId = AuthHandler.ref.user?.userId ?? 0;

        checkStatusDto = await _checkStatusUsecase.execute(userId);
      },
    );
  }

  Future<void> validateOfficeRange(Position? position) async {
    const double officeLatitude = 24.9392;
    const double officeLongitude = 67.1019;

    double distance = Geolocator.distanceBetween(
      position!.latitude,
      position.longitude,
      officeLatitude,
      officeLongitude,
    );
    appPrint('Distance from office: ${distance} meters');
    appPrint('Latitude: ${position.latitude}');
    appPrint('Longitude: ${position.longitude}');

    if (distance > 50) {
      throw OfficeRangeException(
        'You are outside the office radius. Move within 50 meters to clock in/out.',
      );
    }
  }
}
