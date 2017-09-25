import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:material_components_web/material_components_web.dart';
import 'package:poll_common/models.dart';

@Component(
    selector: 'poll-list',
    templateUrl: 'poll_list.html',
    styleUrls: const ['poll_list.css'],
    directives: const [mdcDirectives, COMMON_DIRECTIVES, NgModel])
class PollListComponent {
  Poll newPoll = new Poll(
    answers: ['', ''],
    title: '',
    description: '',
  );

  String computeAnswerHintText(int i) => 'Answer #${i + 1}';

  void addAnswer() => newPoll.answers.add('');

  void updateAnswer(int i, String $event) {
    newPoll.answers[i] = $event;
  }

  void removeAnswer(int i) {
    newPoll.answers.removeAt(i);
  }
}
