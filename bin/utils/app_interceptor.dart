import 'package:jwt_decode/jwt_decode.dart';

class AppInterceptor {
  Future<bool> fnCheckJwt(String jwt) async {
    return Jwt.isExpired(jwt);
  }
}
