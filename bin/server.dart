// Copyright (c) 2021, the Dart project authors.

import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

Future<void> main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final cascade = Cascade()
    .add(_staticHandler);

  final server = await shelf_io.serve(
    logRequests()
      .addHandler(cascade.handler),
    InternetAddress.anyIPv4,
    port,
  );

  print('App listening on port ${server.port}');
}

final _staticHandler =
  shelf_static.createStaticHandler('public', defaultDocument: 'index.html');
