import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/auth_c.dart';
import '../controllers/user_c.dart';
import '../utils/app_constanta.dart';
import 'app_route_field.dart';
import 'app_route_user.dart';

class AppRoute {
  Handler get routes {
    final app = Router();
    app.post('$baseUrl/signup', AuthController.fnPostSignup);
    app.post('$baseUrl/signin', AuthController.fnPostSignin);
    app.get('$baseUrl/categories', UserController.fnCategories);
    app.mount('$baseUrl/users', AppRouteUser().router);
    app.mount('$baseUrl/fields', AppRouteField().router);
    return app;
  }
}
