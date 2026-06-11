import 'package:login_api/app/core/services/network_service/entities/api_route_entity.dart';
import 'package:login_api/app/core/services/network_service/entities/file_entity.dart';



abstract class BaseApiService {
  Future requestGET(
      {required ApiRouteEntity apiRoute,
      required Map<String, String>? headers});

  Future requestPOST(
      {required ApiRouteEntity apiRoute,
      Object? data,
      Map<String, String>? headers});

  Future requestPUT(
      {required ApiRouteEntity apiRoute,
      Object? data,
      required Map<String, String>? headers});

  Future requestDELETE(
      {required ApiRouteEntity apiRoute,
      Object? data,
      required Map<String, String>? headers});

  Future requestMultiPartPOST({
    required List<FileEntity> files,
    required ApiRouteEntity apiRoute,
    Map<String, String>? data,
    required Map<String, String> headers,
  });

  Future requestMultiPartPUT({
    required List<FileEntity> files,
    required ApiRouteEntity apiRoute,
    Map<String, String>? data,
    required Map<String, String> headers,
  });
}
