import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../models/user_m.dart';

abstract class AuthRepo {
  AuthRepo();

  Future<PostgrestResponse<dynamic>?> getUsers();

  Future<PostgrestResponse<dynamic>?> addUser(UserM user);

  Future<GotrueSessionResponse?> signin(String email, String password);

  Future<GotrueSessionResponse?> signup(String email, String password);
}
