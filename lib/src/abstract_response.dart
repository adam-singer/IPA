part of ipa;

abstract class AbstractResponse {

  List<AbstractResponseHeader> _headers;
  final AbstractView _view;

  /**
   * Initializes the response
   *
   * @param AbstractView this._view - The view to encapsulate in this response
   */
  AbstractResponse(this._view) {
    this._headers = [];
  }

  /**
   * Abstract method for representing the http response code of this response
   *
   * @return int - Integer of the http response code
   */
  int statusCode();

  /**
   * Adds a http header to this response
   *
   * @param AbstractResponseHeader header - The http header to associate
   * @return AbstractResponse             - This response
   */
  AbstractResponse withHeader(AbstractResponseHeader header) {
    this._headers.add(header);
    return this;
  }

  /**
   * Adds mutliple http headers to the response
   *
   * @param Iterable<AbstractResponseHeader> headers - The headers to add
   * @return AbstractResponse                        - This response
   */
  AbstractResponse withHeaders(Iterable<AbstractResponseHeader> headers) {
    this._headers.addAll(headers);
    return this;
  }

  /**
   * Getter for the headers of this response
   *
   * @return List<AbstractResponseHeader> - The headers
   */
  List<AbstractResponseHeader> get headers => this._headers;

  /**
   * Getter for the view of this response
   *
   * @return AbstractView - The view
   */
  AbstractView get view => this._view;

}