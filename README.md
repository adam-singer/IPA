IPA
===
A Dart web framework with taste.

Example
-------
controllers/index/index_get_handler.dart
```dart
import 'package:ipa/ipa.dart';

class IndexGetHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new StringView("Welcome to the index");
    var response = new OkResponse(view);
    return new Future.value(response);
  }

}
```

controllers/redirect/redirect_get_handler.dart
```dart
import 'package:ipa/ipa.dart';

class RedirectGetHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new EmptyView();
    var response = new TemporaryRedirectResponse(view);
    var location = new LocationResponseHeader("/");
    return new Future.value(response.withHeader(location));
  }

}
```

controllers/fallback_handler.dart
```dart
import 'package:ipa/ipa.dart';

class FallbackHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new StringView("Missing page.");
    var response = new MissingResponse(view);
    return new Future.value(response);
  }

}
```

main.dart
```dart
import 'package:ipa/ipa.dart';
import 'controllers/fallback_handler.dart';
import 'controllers/index/index_get_handler.dart';
import 'controllers/redirect/redirect_get_handler.dart';

main() {

  var serviceManager = new ServiceManager({});
  var httpRouter     = new HttpRouter(serviceManager, {
    'r:.*:3000': {
      'GET': {
        '/':         new IndexGetHandler(),
        '/redirect': new RedirectGetHandler()
      }
    }
  }, new FallbackHandler());

  var app = new IPA(httpRouter);
  app.listen('127.0.0.1', 3000);

}
```