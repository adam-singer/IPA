import 'package:ipa/ipa.dart';

class IndexGetHandler extends AbstractController {

  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req) {
    var view     = new StringView("Welcome to the index");
    var response = new OkResponse(view);
    return new Future.value(response);
  }

}