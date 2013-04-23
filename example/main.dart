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