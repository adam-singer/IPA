part of ipa;

class WwwAuthenticateResponseHeader extends AbstractResponseHeader {

  /**
   * Initializes the value of this header
   *
   * @param String value - The value of this header
   */
  WwwAuthenticateResponseHeader(String value) : super(value);

  /**
   * Getter for the value of the header
   *
   * @return String - The value of this header
   */
  String getKey() {
    return HttpHeaders.WWW_AUTHENTICATE;
  }

}
