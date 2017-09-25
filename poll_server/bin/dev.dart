import 'dart:async';
import 'dart:io';
import 'package:angel_framework/angel_framework.dart';
import 'package:logging/logging.dart';
import 'package:poll_server/poll_server.dart';

main() async {
  var app = await createServer();
  var server = await app.startServer(InternetAddress.LOOPBACK_IP_V4, 3000);
  print('Listening at http://${server.address.address}:${server.port}');
}

Future<Angel> createServer() async {
  // The default HTTP headers sent by `dart:io` send an `x-xss-protection`
  // header that messes with `package:angel_proxy`, so in development,
  // we should disable that functionality.
  var app = new Angel.custom((address, port) async {
    var server = await HttpServer.bind(address, port);
    return server..defaultResponseHeaders.removeAll('x-xss-protection');
  });

  await app.configure(configureServer);

  Logger.root.onRecord.listen((rec) {
    print(rec);
    if (rec.error != null) print(rec.error);
    if (rec.stackTrace != null) print(rec.stackTrace);
  });

  return app;
}
