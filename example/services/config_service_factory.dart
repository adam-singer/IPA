import 'package:ipa/ipa.dart';
import 'package:json_config/json_config.dart';

class ConfigServiceFactory extends ServiceFactory {

  Future<dynamic> _future;

  Future<dynamic> make(ServiceManager serviceManager) {
    if (this._future == null) {
      var config   = new JsonConfig.fromMultiple([
        new JsonConfigPathRecursiveDirectory("./config/common"),
        new JsonConfigPathRecursiveDirectory("./config/env/dev")
      ]);
      this._future = new Future.value(config);
    }
    return this._future;
  }

}