library poll_common.src.models.poll;

import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'poll.g.dart';

@serializable
class _Poll extends Model {
  String title, description;
  List<String> answers;
}
