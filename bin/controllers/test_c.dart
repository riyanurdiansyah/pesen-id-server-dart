import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/form_data.dart';
import 'package:shelf_multipart/multipart.dart';

class TestController {
  static handler(Request request) async {
    if (!request.isMultipart) {
      return Response.ok('Not a multipart request');
    } else if (request.isMultipartForm) {
      final description = StringBuffer('Parsed form multipart request\n');

      await for (final formData in request.multipartFormData) {
        description
            .writeln('${formData.name}: ${await formData.part.readString()}');
      }

      return Response.ok(description.toString());
    } else {
      final description = StringBuffer('Regular multipart request\n');

      await for (final part in request.parts) {
        description.writeln('new part');

        part.headers
            .forEach((key, value) => description.writeln('Header $key=$value'));
        final content = await part.readString();
        description.writeln('content: $content');

        description.writeln('end of part');
      }

      return Response.ok(description.toString());
    }
  }
}
