import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../models/response_m.dart';
import '../services/field_service.dart';
import '../utils/app_response.dart';

class FieldController {
  static fnGetFields(Request request) async {
    final response = await FieldService().getFields();
    if (response!.data != null) {
      // final users = <UserM>[];
      // for (var data in response.data) {
      //   users.add(UserM.fromJson(data));
      // }
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: response.data)));
    } else {
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: [])));
    }
  }

  static fnGetFieldById(Request request, String id) async {
    final response = await FieldService().getFieldById(id);
    if (response!.data != null) {
      // final user = UserM.fromJson(response.data[0]);
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: 200, message: 'Success', data: response.data[0])));
    } else {
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: [])));
    }
  }

  static fnDeleteFieldById(Request request, String id) async {
    final response = await FieldService().deleteFieldById(int.parse(id));
    if (response!.data != null) {
      return AppResponse.response(response.status!,
          jsonEncode(ResponseM(status: 200, message: 'Success', data: {})));
    } else {
      return AppResponse.response(
          response.status!,
          jsonEncode(ResponseM(
              status: response.status!,
              message: response.error!.message,
              data: {})));
    }
  }
}
