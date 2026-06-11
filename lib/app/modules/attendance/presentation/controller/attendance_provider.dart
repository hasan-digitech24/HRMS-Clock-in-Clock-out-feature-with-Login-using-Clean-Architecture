import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/core/services/registry_service/di.dart';
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

  Future<void> clockIn(ClockInEntity entity, int id) async {
    await executeAPI(
      apiEndPoint: ApiRoutes.clockIn(1),
      onExecute: () async {
        final userId =  AuthHandler.ref.user?.userId ?? 0;
        clockInDto = await _clockInUsecase.execute(entity, userId );
        await checkClockInClockOutStatus();
                  // checkStatusDto = await _checkStatusUsecase.execute(userId ); 
        Prompt.showSuccess('Clock-in successful');
      },
      
    );
  }

  Future<void> checkClockInClockOutStatus() async {
    await executeAPI(
      apiEndPoint: ApiRoutes.checkStatus(1),
      onExecute: () async {
        final userId =  AuthHandler.ref.user?.userId ?? 0;
        checkStatusDto = await _checkStatusUsecase.execute(userId );
      },
      
    );
  }

   Future<void> clockOut(ClockInEntity entity, int id) async {
    await executeAPI(
      apiEndPoint: ApiRoutes.clockIn(2),
      onExecute: () async {
        final userId =  AuthHandler.ref.user?.userId ?? 0;
        clockInDto = await _clockInUsecase.execute(entity, userId );  
                await checkClockInClockOutStatus();

                // checkStatusDto = await _checkStatusUsecase.execute(userId ); 
        Prompt.showSuccess('Clock-out successful');
      },
      
    );
  }

}