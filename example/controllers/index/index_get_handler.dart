import 'package:ipa/ipa.dart';

class IndexGetHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    return sm.get("config").then((config) {
      var view = new StringView("Welcome to " + config.getOrElse("title", ""));
      return new OkResponse(view);
    });
  }

}