import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../models/response_m.dart';
import '../models/user_m.dart';
import '../services/user_service.dart';
import '../utils/app_response.dart';

class UserController {
  static fnGetUser(Request request) async {
    final response = await UserService().getUsers();
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
    final response = await UserService().getUserById(id);
    if (response!.data != null) {
      final user = UserM.fromJson(response.data[0]);
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: user.toJson())));
    } else {
      return AppResponse.response(
          response.status!, jsonEncode({'message': response.error!.message}));
    }
  }

  static fnAddUser(Request request, Session data, UserM user) async {
    final response = await UserService().addUser(user);
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
