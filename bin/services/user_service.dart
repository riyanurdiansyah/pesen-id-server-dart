import 'package:postgrest/src/postgrest_response.dart';
import '../models/user_m.dart';
import '../repositories/user_repo.dart';
import '../utils/app_constanta.dart';

class UserService extends UserRepo {
  @override
  Future<PostgrestResponse<dynamic>?> getUsers() async {
    try {
      return await db.from('tb_users').select('*').execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse<dynamic>?> getUserById(String id) async {
    try {
      return await db.from('tb_users').select('*').eq('id', id).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse?> addUser(UserM user) async {
    try {
      return await db.from('tb_users').insert([user.toJsonSignup()]).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse?> getCategories() async {
    try {
      return await db.from('tb_categories').select('*').execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }
}
