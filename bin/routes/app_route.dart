import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/auth_c.dart';
import '../models/user_m.dart';
import '../services/auth_service.dart';
import '../utils/app_constanta.dart';
import '../utils/app_response.dart';

class AppRoute {
  final routes = Router()
    ..get('$baseUrl/users', fnGetUser)
    ..post('$baseUrl/add', fnAddUser)
    ..post('$baseUrl/signup', AuthController.fnPostSignup)
    ..post('$baseUrl/signin', AuthController.fnPostSignin);

  static fnGetUser(Request request) async {
    final response = await AuthService().getUsers();
    if (response!.data != null) {
      return AppResponse.response(200, jsonEncode(response.data));
    } else if (response.status == 200) {
      return AppResponse.response(
          200, jsonEncode({'message': response.error!.message}));
    } else if (response.status == 404) {
      return AppResponse.response(
          404, jsonEncode({'message': 'route tidak ditemukan'}));
    } else {
      return AppResponse.response(
          500, jsonEncode({'message': 'Gagal terhubung keserver'}));
    }
  }

  static fnAddUser(Request request) async {
    final jwt = request.headers['Authorization']!.split('Bearer')[1].trimLeft();
    bool isExpired = Jwt.isExpired(jwt);
    if (isExpired) {
      return AppResponse.response(401, jsonEncode({'message': 'Unauthorized'}));
    } else {
      final body = json.decode(await request.readAsString());
      final user = UserM(
        name: body['name'],
        email: body['email'],
        handphone: body['handphone'],
        role: body['role'],
        id: -99,
        username: body['username'],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      final response = await AuthService().addUser(user);
      if (response!.data != null) {
        return AppResponse.response(200, jsonEncode(response.data));
      } else if (response.status == 200) {
        return AppResponse.response(
            200, jsonEncode({'message': response.error!.message}));
      } else if (response.status == 404) {
        return AppResponse.response(
            404, jsonEncode({'message': 'route tidak ditemukan'}));
      } else {
        return AppResponse.response(
            500, jsonEncode({'message': 'Gagal terhubung keserver'}));
      }
    }
  }
}
