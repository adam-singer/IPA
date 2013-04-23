part of ipa;

class ContentRangeResponseHeader extends AbstractResponseHeader {

  /**
   * Initializes the value of this header
   *
   * @param String value - The value of this header
   */
  ContentRangeResponseHeader(String value) : super(value);

  /**
   * Getter for the value of the header
   *
   * @return String - The value of this header
   */
  String getKey() {
    return HttpHeaders.CONTENT_RANGE;
  }

}
