import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:material_components_web/material_components_web.dart';
import '../poll_list/poll_list.dart';

@Component(
    selector: 'poll-app',
    templateUrl: 'poll_app.html',
    directives: const [mdcDirectives, ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(
    path: '/',
    name: 'List',
    component: PollListComponent,
    useAsDefault: true,
  ),
])
class PollAppComponent {}
