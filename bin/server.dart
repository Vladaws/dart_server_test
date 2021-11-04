import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  Router app = Router();

  app.get('/hello', (Request request) {
    print('request received!!!!');
    return Response.ok('hello-world');
  });

  var handler = const Pipeline().addMiddleware(logRequests()).addHandler(app);

  await io.serve(handler, InternetAddress.anyIPv4, 8080);
}
