import 'dart:io';
import 'dart:typed_data';

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

  @override
  Future<StorageResponse?> uploadImage(
      List<Map<String, dynamic>> listParam, Uint8List image, String id) async {
    try {
      Directory directory = Directory.current;
      final file =
          await File('${directory.path}/assets/images/${listParam[0]['image']}')
              .create();
      file.writeAsBytesSync(image);
      // final pat = lookupMimeType(file.path);
      final res = await db.storage.from('storages').upload(
          '/images/$id.png', file,
          fileOptions: FileOptions(cacheControl: '3600', upsert: false));
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
    return null;
  }
}
