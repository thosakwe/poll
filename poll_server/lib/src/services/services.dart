import 'package:angel_framework/angel_framework.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'poll.dart' as poll;
import 'vote.dart' as vote;

/// Returns a plug-in that registers our MongoDB-enabled services on a server.
AngelConfigurer configureServer(Db db) {
  return (Angel app) async {
    await app.configure(poll.configureServer(db));
    await app.configure(vote.configureServer(db));
  };
}