import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../models/categori_m.dart';
import '../models/response_m.dart';
import '../models/user_m.dart';
import '../services/user_service.dart';
import '../utils/app_response.dart';

class UserController {
  static fnCategories(Request request) async {
    final response = await UserService().getCategories();
    if (response!.data != null) {
      final categories = <CategoriM>[];
      for (var data in response.data) {
        categories.add(CategoriM.fromJson(data));
      }
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: categories)));
    } else {
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: [])));
    }
  }

  static fnGetUsers(Request request) async {
    final response = await UserService().getUsers();
    if (response!.data != null) {
      final users = <UserM>[];
      for (var data in response.data) {
        users.add(UserM.fromJson(data));
      }
      return AppResponse.response(response.status!,
          jsonEncode(ResponseM(status: 200, message: 'Success', data: users)));
    } else {
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: [])));
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
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: {})));
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
