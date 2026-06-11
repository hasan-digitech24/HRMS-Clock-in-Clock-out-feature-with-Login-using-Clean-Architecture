import 'package:login_api/app/modules/attendance/data/dto/clock_in_dto.dart';
import 'package:login_api/app/modules/attendance/domain/entity/clock_in_entity.dart';
import 'package:login_api/app/modules/attendance/domain/repo/attendance_repo.dart';

class ClockInUsecase {
  final AttendanceRepo repo;
  ClockInUsecase(this.repo);

  Future<ClockInDto> execute(ClockInEntity entity, int id) async {
    return await repo.clockIn(entity, id);
  }
  
  }