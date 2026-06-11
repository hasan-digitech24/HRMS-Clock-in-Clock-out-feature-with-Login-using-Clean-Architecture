import 'package:login_api/app/modules/attendance/data/dto/check_status_dto.dart';
import 'package:login_api/app/modules/attendance/domain/repo/attendance_repo.dart';

class CheckStatusUsecase {
  final AttendanceRepo repo;
  CheckStatusUsecase(this.repo);

  Future<CheckStatusDto> execute(int id) async {
    return await repo.checkClockInClockOutStatus(id);
  }
  
  }