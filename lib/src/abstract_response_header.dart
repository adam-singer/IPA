part of ipa;

abstract class AbstractResponseHeader {

  final String _value;

  /**
   * Initializes the value of the header
   *
   * @param String this._value - The value of the header
   */
  AbstractResponseHeader(this._value);

  /**
   * Abstract method meant to return the name of the header
   *
   * @return String - The name of the header
   */
  String getKey();

  /**
   * Getter for the value of the header
   *
   * @return String - The value of the header
   */
  String getValue() {
    return this._value;
  }

}