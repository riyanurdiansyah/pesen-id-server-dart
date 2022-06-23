import 'package:supabase/supabase.dart';
import '../repositories/auth_repo.dart';
import '../utils/app_constanta.dart';

class AuthService extends AuthRepo {
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
}
