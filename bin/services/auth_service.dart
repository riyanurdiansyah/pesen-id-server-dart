import 'package:shelf/src/response.dart';
import 'package:supabase/supabase.dart';
import '../models/user_m.dart';
import '../repositories/auth_repo.dart';
import '../utils/app_constanta.dart';

class AuthService extends AuthRepo {
  @override
  Future<PostgrestResponse<dynamic>?> getUsers() async {
    try {
      return await db.from('users').select('*').eq('id', 1).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse<dynamic>?> getUserById(String id) async {
    try {
      return await db.from('users').select('*').eq('id', id).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<GotrueSessionResponse?> signin(String email, String password) async {
    try {
      return await db.auth.signIn(email: email, password: password);
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
      return await db.from('users').insert([
        user.toJson(),
      ]).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }
}
