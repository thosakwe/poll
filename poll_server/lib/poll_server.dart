import 'dart:async';
import 'package:angel_configuration/angel_configuration.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'src/services/services.dart' as services;

/// Sets up an [Angel] instance to serve the poll app server.
Future configureServer(Angel app) async {
  // Angel 1.1.0+ plug-ins use `package:file` (created by the Dart team) instead of `dart:io`
  // to access the filesystem.
  //
  // The main benefit of `package:file` is that it is pluggable and mockable.
  // For example, functionality can be tested with an in-memory filesystem.
  var fileSystem = const LocalFileSystem();

  // Create a `Logger` for this instance of the server.
  app.logger = new Logger('poll_server');

  // Load application configuration
  await app.configure(configuration(fileSystem));

  // Open a connection to MongoDB, using the connection string from our
  // application configuration.
  var db = new Db(app.configuration['mongo_db']);
  await db.open();

  // Now, connect our services, which leverage MongoDB, to the server.
  await app.configure(services.configureServer(db));

  // In development, we will want to enable CORS, since our Web application
  // will be served from http://localhost:8080
  app.use(cors());

  // In production, we want to serve static assets from ../poll_web/build/web.
  if (app.isProduction) {
    // A `CachingVirtualDirectory` serves static files, and it also sends
    // `Cache-Control` headers.
    var vDir = new CachingVirtualDirectory(
      app,
      fileSystem,
      source: fileSystem.directory('../poll_web/build/web'),
    );

    app.use(vDir.handleRequest);

    // Redirect 404's to index.html (push-state)
    app.use((RequestContext req, ResponseContext res) {
      // If the client doesn't want HTML, don't send the HTML file.
      if (!req.accepts('text/html') || req.path.endsWith('.js')) return true;
      return vDir.servePath('index.html', req, res);
    });
  }

  // Throw a 404 if no route matched the requested path.
  app.use(() => throw new AngelHttpException.notFound());
}
