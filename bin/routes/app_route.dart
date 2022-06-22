import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/auth_c.dart';
import '../models/response_m.dart';
import '../models/user_m.dart';
import '../services/auth_service.dart';
import '../utils/app_constanta.dart';
import '../utils/app_response.dart';

class AppRoute {
  final routes = Router()
    ..get('$baseUrl/users', fnGetUser)
    ..get('$baseUrl/users/<id>', fnGetUserById)
    ..post('$baseUrl/signup', AuthController.fnPostSignup)
    ..post('$baseUrl/signin', AuthController.fnPostSignin);

  static fnGetUser(Request request) async {
    final response = await AuthService().getUsers();
    if (response!.data != null) {
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: response.data)));
    } else {
      return AppResponse.response(
          response.status!, jsonEncode({'message': response.error!.message}));
    }
  }

  static fnGetUserById(Request request, String id) async {
    final response = await AuthService().getUserById(id);
    if (response!.data != null) {
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: response.data)));
    } else {
      return AppResponse.response(
          response.status!, jsonEncode({'message': response.error!.message}));
    }
  }
}
