library poll_server.src.services.poll;

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_mongo/angel_mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';

AngelConfigurer configureServer(Db db) {
  return (Angel app) async {
    app.use('/api/polls', new MongoService(db.collection('polls')));
  };
}
