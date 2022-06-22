import 'package:shelf/src/response.dart';
import 'package:supabase/supabase.dart';
import '../models/user_m.dart';
import '../repositories/auth_repo.dart';
import '../utils/app_constanta.dart';

class AuthService extends AuthRepo {
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
  Future<GotrueSessionResponse?> signin(String email, String password) async {
    try {
      final res = await db.auth.signIn(email: email, password: password);
      print("CEK : $res");
      return res;
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<GotrueSessionResponse?> signup(String email, String password) async {
    try {
      return await db.auth.signUp(email, password);
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse?> addUser(UserM user) async {
    try {
      final res = await db.from('tb_users').insert([
        user.toJson(),
      ]).execute();
      print("RES ADD : ${res.data}");
      return res;
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }
}
