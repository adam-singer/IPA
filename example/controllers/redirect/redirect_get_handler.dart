import 'package:ipa/ipa.dart';

class RedirectGetHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new EmptyView();
    var response = new TemporaryRedirectResponse(view);
    var location = new LocationResponseHeader("/");
    return new Future.value(response.withHeader(location));
  }

}