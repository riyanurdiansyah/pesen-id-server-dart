import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/field_c.dart';
import '../utils/app_middleware.dart';

class AppRouteField {
  Handler get router {
    final route = Router();
    route.get('/', FieldController.fnGetFields);
    route.get('/<id>', FieldController.fnGetFieldById);
    route.delete('/<id>', FieldController.fnDeleteFieldById);
    final handler = Pipeline()
        .addMiddleware(AppMiddleware().checkAuthorization())
        .addHandler(route);
    return handler;
  }
}
