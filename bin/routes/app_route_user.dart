import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/user_c.dart';
import '../utils/app_middleware.dart';

class AppRouteUser {
  Handler get router {
    final route = Router();
    route.get('/', UserController.fnGetUsers);
    route.get('/<id>', UserController.fnGetUserById);
    final handler = Pipeline()
        .addMiddleware(AppMiddleware().checkAuthorization())
        .addHandler(route);
    return handler;
  }
}
