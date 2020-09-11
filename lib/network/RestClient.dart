import 'package:dio/dio.dart';
import 'package:panasiatech/module/login/model/LoginRequest.dart';
import 'package:panasiatech/module/login/model/LoginResponse.dart';

import 'package:retrofit/http.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: "https://reqres.in")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/api/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

}