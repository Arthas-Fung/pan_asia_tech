import 'package:dio/dio.dart';
import 'package:panasiatech/module/login/model/LoginRequest.dart';
import 'package:panasiatech/module/login/model/LoginResponse.dart';
import 'package:panasiatech/network/RestClient.dart';
import 'package:panasiatech/settings.dart';

final dio = Dio();
final logger = getLogger();
abstract class LoginRepo {
  Future<LoginResponse> login(LoginRequest request);
}

class LoginRepoImpl implements LoginRepo {
  RestClient _client = RestClient(dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _client.login(request).then((it) {
      logger.i(it);
      return it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          logger.e("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
          logger.e("Unknow Exception");
      }
    });
  }

}