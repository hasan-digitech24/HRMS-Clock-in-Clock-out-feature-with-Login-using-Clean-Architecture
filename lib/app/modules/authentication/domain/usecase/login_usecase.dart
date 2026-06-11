import 'package:login_api/app/modules/authentication/data/dto/login_dto.dart';
import 'package:login_api/app/modules/authentication/domain/entities/login_entity.dart';
import 'package:login_api/app/modules/authentication/domain/repo/auth_repo.dart';

class LoginUsecase {
  final AuthRepo repo;
  LoginUsecase(this.repo);

  Future<LoginDto> execute(LoginEntity entity) async {
    return await repo.login(entity);
  }
  
}