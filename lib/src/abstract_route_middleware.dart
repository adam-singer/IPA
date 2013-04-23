part of ipa;

abstract class AbstractRouteMiddleware {

  final ServiceManager _serviceManager;

  /**
   * Initializes the route middleware with the service manager
   *
   * @param ServiceManager this._serviceManager - The service manager
   */
  AbstractRouteMiddleware(this._serviceManager);

  /**
   * Abstract method to be implemented as the handler for the middleware
   *
   * @param ServiceManager sm - The service manager
   * @param HttpRequest req   - The http request to pass through middleware
   * @return Future<bool>     - The hijacking future
   */
  Future<bool> handle(ServiceManager sm, HttpRequest req);

}