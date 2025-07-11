import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/login/model/login_response.dart';
import 'api_endpoints.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiEndPoints.login)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST(ApiEndPoints.register)
  @MultiPart()
  Future<LoginResponse> register(
    @Part(name: "first_name") String firstName,
    @Part(name: "last_name") String lastName,
    @Part(name: "phone") String phone,
    @Part(name: "latitude") String latitude,
    @Part(name: "longitude") String longitude,
    @Part(name: "device_token") String deviceToken,
    @Part(name: "photo") File? photoFile,
  );
}
