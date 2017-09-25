library poll_common.src.models.vote;

import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'vote.g.dart';

@serializable
class _Vote extends Model {
  String pollId;
  int answerIndex;
}
