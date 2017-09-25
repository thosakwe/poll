import 'package:angel_client/browser.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:poll_web/components/poll_app/poll_app.dart';

main() {
  bootstrap(PollAppComponent, [
    ROUTER_PROVIDERS,
    provide(Angel, useValue: new Rest('http://localhost:3000')),
    provide(LocationStrategy, useClass: HashLocationStrategy),
  ]);
}
