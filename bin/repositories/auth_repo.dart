import 'package:supabase/supabase.dart';

abstract class AuthRepo {
  AuthRepo();

  Future<GotrueSessionResponse?> signin(String email, String password);

  Future<GotrueSessionResponse?> signup(String email, String password);
}
