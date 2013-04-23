import 'package:ipa/ipa.dart';

class FallbackHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new StringView("Missing page.");
    var response = new MissingResponse(view);
    return new Future.value(response);
  }

}