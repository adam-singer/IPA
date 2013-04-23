part of ipa;

class UnsupportedMediaTypeResponse extends AbstractResponse {

  /**
   * Initialize the response with a view
   *
   * @param AbstractView - The view
   */
  UnsupportedMediaTypeResponse(AbstractView view) : super(view);

  /**
   * The status code of this response type
   *
   * @return int - The status code as an int
   */
  int statusCode() {
    return 415;
  }

}