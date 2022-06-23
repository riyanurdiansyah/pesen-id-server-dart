import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'config/config.dart';
import 'routes/app_route.dart';
import 'utils/app_middleware.dart';

// Configure routes.
// final _router = Router()
//   ..get('/', _rootHandler)
//   ..get('/echo/<message>', _echoHandler);

// Response _rootHandler(Request req) {
//   return Response.ok('Hello, World!\n');
// }

// Response _echoHandler(Request request) {
//   final message = params(request, 'message');
//   return Response.ok('$message\n');
// }

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(AppMiddleware().handleCors())
      .addMiddleware(AppMiddleware().handleAuth(Env.jwtSecretKey))
      .addHandler(AppRoute().routes);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_handler, 'localhost', port);
  print('Server listening on port ${server.port}');
}
