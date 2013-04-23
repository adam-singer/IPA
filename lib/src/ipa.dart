part of ipa;

class IPA {

  HttpRouter _router;

  /**
   * Initialize an IPA instance
   *
   * @param HttpRouter this._router - The router to use
   */
  IPA(this._router);

  /**
   * Bind this IPA instance to a port and start accepting requests
   *
   * @param String host - The host to bind to
   * @param int port    - The port to listen on
   * @return IPA        - This IPA instance
   */
  IPA listen(String host, int port) {
    HttpServer.bind(host, port).then((HttpServer server) {
      server.pipe(this._router);
    });
    return this;
  }

}