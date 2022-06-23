import 'package:shelf_router/shelf_router.dart';
import '../controllers/auth_c.dart';
import '../utils/app_constanta.dart';
import 'app_route_auth.dart';

class AppRoute {
  final routes = Router()
    ..post('$baseUrl/signup', AuthController.fnPostSignup)
    ..post('$baseUrl/signin', AuthController.fnPostSignin)
    ..get('$baseUrl/users', AppRouteAuth().router)
    ..get('$baseUrl/users/<id>', AppRouteAuth().router);
}
