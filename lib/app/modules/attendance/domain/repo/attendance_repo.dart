import 'package:login_api/app/modules/attendance/data/dto/check_status_dto.dart';
import 'package:login_api/app/modules/attendance/data/dto/clock_in_dto.dart';
import 'package:login_api/app/modules/attendance/domain/entity/clock_in_entity.dart';

abstract interface class AttendanceRepo {
  Future<ClockInDto> clockIn(ClockInEntity entity, int id);
    Future<CheckStatusDto> checkClockInClockOutStatus(int id);
}