import 'package:supabase/supabase.dart';
import '../models/user_m.dart';

abstract class UserRepo {
  Future<PostgrestResponse<dynamic>?> getUsers();

  Future<PostgrestResponse<dynamic>?> getUserById(String id);

  Future<PostgrestResponse<dynamic>?> addUser(UserM user);

  Future<PostgrestResponse<dynamic>?> getCategories();
}
