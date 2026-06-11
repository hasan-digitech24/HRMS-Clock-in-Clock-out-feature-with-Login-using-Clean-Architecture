import 'package:login_api/app/modules/authentication/data/dto/login_dto.dart';
import 'package:login_api/app/modules/authentication/domain/entities/login_entity.dart';

abstract interface class AuthRepo {
  Future<LoginDto> login(LoginEntity entity);
}