import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../controllers/user_c.dart';
import '../utils/app_constanta.dart';
import '../utils/app_middleware.dart';

class AppRouteAuth {
  Handler get router {
    final route = Router();

    route.get('$baseUrl/users', UserController.fnGetUser);
    route.get('$baseUrl/users/<userid>', UserController.fnGetUserById);

    final handler = Pipeline()
        .addMiddleware(AppMiddleware().checkAuthorization())
        .addHandler(route);
    return handler;
  }
}
