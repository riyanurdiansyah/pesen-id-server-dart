import 'dart:typed_data';

import 'package:supabase/supabase.dart';

abstract class AuthRepo {
  AuthRepo();

  Future<GotrueSessionResponse?> signin(String email, String password);

  Future<GotrueSessionResponse?> signup(String email, String password);

  Future<StorageResponse?> uploadImage(
      List<Map<String, dynamic>> listParam, Uint8List image, String id);
}
