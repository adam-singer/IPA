part of ipa;

abstract class AbstractController extends HttpRouteHandler {

  /**
   * This is the base method of the controller that handles the execution
   * of controller specific middleware and the handing off to the controller's
   * `#handle()` function if the control isn't hijacked by a middleware.
   *
   * @param ServiceManager sm - The service manager
   * @param HttpRequest req   - The http request to handle
   * @return void
   */
  void handler(ServiceManager sm, HttpRequest req) {
    var res  = this._runMiddlewares(sm, req).then((v) {
      return this.handle(sm, req);
    }).catchError((haltedResponse) {
      return haltedResponse;
    });

    this._handleResponse(req, res);
  }

  /**
   * Returns a list of middleware to run everytime this controller receives
   * a request
   *
   * @param ServiceManager sm              - The service manager
   * @return List<AbstractRouteMiddleware> - The list of middleware
   */
  List<AbstractRouteMiddleware> middleware(ServiceManager sm) {
    return [];
  }

  /**
   * The abstract handler for the controller to implement for handling the
   * request after middleware have been processed.
   *
   * @param ServiceManager sm         - The service manager
   * @param HttpRequest req           - The http request to handle
   * @return Future<AbstractResponse> - The future of the response
   */
  Future<AbstractResponse> handle(ServiceManager sm, HttpRequest req);

  /**
   * Helper method for running the middleware for this controller
   *
   * @param ServiceManager sm         - The service manager
   * @param HttpRequest req           - The http request to run in middleware
   * @return Future<AbstractResponse> - The future of the middleware results
   */
  Future<AbstractResponse> _runMiddlewares(ServiceManager sm, HttpRequest req)
  {
    return this.middleware(sm).fold(new Future.value(true), (memo, middleware) {
      return memo.then(() => middleware.handle(sm, req));
    });
  }

  /**
   * Helper method for handling the response returned by the controller
   *
   * @param HttpRequest req                    - The handled http request
   * @param Future<AbstractResponse> resFuture - The future of the response
   * @return Future
   */
  Future _handleResponse(HttpRequest req, Future<AbstractResponse> resFuture) {
    return resFuture.then((AbstractResponse res) {
      return this._setStatusCode(req, res)
                 ._setHeaders(req, res)
                 ._setBody(req, res)
                 .close();
    });
  }

  /**
   * Helper method for setting the HTTP status code of the controllers response
   *
   * @param HttpRequest req      - The http request
   * @param AbstractResponse res - The response from the controller
   * @return AbstractController  - The controller
   */
  AbstractController _setStatusCode(HttpRequest req, AbstractResponse res) {
    req.response.statusCode = res.statusCode();
    return this;
  }

  /**
   * Helper method for setting the http headers of the controllers response
   *
   * @param HttpRequest req      - The http request
   * @param AbstractResponse res - The response from the controller
   * @return AbstractController  - The controller
   */
  AbstractController _setHeaders(HttpRequest req, AbstractResponse res) {
    for (var header in res.headers) {
      req.response.headers.add(header.getKey(), header.getValue());
    }
    return this;
  }

  /**
   * Helper method for setting the body of the http response
   *
   * @param HttpRequest req      - The http request
   * @param AbstractResponse res - The response from the controller
   * @return HttpResponse        - The http response object
   */
  HttpResponse _setBody(HttpRequest req, AbstractResponse res) {
    req.response.add(res.view.render().codeUnits);
    return req.response;
  }

}