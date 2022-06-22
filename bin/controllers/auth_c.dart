import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../models/response_m.dart';
import '../models/user_m.dart';
import '../services/auth_service.dart';
import '../utils/app_interceptor.dart';
import '../utils/app_response.dart';

class AuthController {
  static fnPostSignin(Request request) async {
    final body = json.decode(await request.readAsString());
    final response =
        await AuthService().signin(body['email'], body['password']);
    if (response!.data != null) {
      final data =
          ResponseM(status: 200, message: 'Success', data: response.data);
      return AppResponse.response(200, jsonEncode(data));
    } else if (response.statusCode == 200) {
      return AppResponse.response(
          200, jsonEncode({'message': response.error!.message}));
    } else if (response.statusCode == 404) {
      return AppResponse.response(
          400, jsonEncode({'message': 'route tidak ditemukan'}));
    } else {
      return AppResponse.response(
          500, jsonEncode({'message': 'Gagal terhubung keserver'}));
    }
  }

  static fnPostSignup(Request request) async {
    final user = UserM.fromJson(json.decode(await request.readAsString()));
    final responseAdd = await AuthService().addUser(user);
    final response = await AuthService().signup(user.email!, user.password!);
    if (response != null && responseAdd != null) {
      if (response.data != null) {
        return AppResponse.response(
            200,
            jsonEncode(ResponseM(
                status: 200, message: 'Success', data: response.data)));
      } else {
        return AppResponse.response(
            403,
            jsonEncode(ResponseM(
                status: 403, message: response.error!.message, data: {})));
      }
    } else {
      return AppResponse.response(response!.statusCode!,
          jsonEncode({'message': response.error!.message}));
    }
  }

  static fnAddUser(Request request, Session data, UserM user) async {
    final isExpired = await AppInterceptor().fnCheckJwt(data.accessToken);
    if (isExpired) {
      return AppResponse.response(401, jsonEncode({'message': 'Unauthorized'}));
    } else {
      final response = await AuthService().addUser(user);
      if (response != null && response.data != null) {
        return AppResponse.response(200,
            jsonEncode(ResponseM(status: 200, message: 'Success', data: data)));
      } else if (response!.status == 200) {
        return AppResponse.response(
            200, jsonEncode({'message': response.error!.message}));
      } else if (response.status == 404) {
        return AppResponse.response(
            400, jsonEncode({'message': 'route tidak ditemukan'}));
      } else {
        return AppResponse.response(
            500, jsonEncode({'message': 'Gagal terhubung keserver'}));
      }
    }
  }
}
