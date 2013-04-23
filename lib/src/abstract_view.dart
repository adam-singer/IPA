part of ipa;

abstract class AbstractView {

  Dictionary <String, dynamic> _data;

  /**
   * Abstract method to be implemented by view implementation
   *
   * @return String - The rendered view
   */
  String render();

  /**
   * Returns all the views data
   *
   * @return Dictionary<String, dynamic> - The views data
   */
  Dictionary<String, dynamic> getData() {
    return this._data;
  }

  /**
   * Gets an optional view value
   *
   * @param String key       - The key to get
   * @return Option<dynamic> - The optional value
   */
  Option<dynamic> get(String key) {
    return this._data.get(key);
  }

  /**
   * Sets a value in the view
   *
   * @param String key    - The key to set
   * @param dynamic value - The value to set
   * @return AbstractView - This view
   */
  AbstractView set(String key, dynamic value) {
    this._data[key] = value;
    return this;
  }

  /**
   * Sets multiple keys in this view
   *
   * @param Map           - The key value pairs to add to this view
   * @return AbstractView - This view
   */
  AbstractView setMultiple(Map map) {
    this._data = this._data.merge(new Dictionary.fromMap(map));
    return this;
  }

  /**
   * To string converter
   *
   * @return String - The string representation of this view
   */
  String toString() {
    this.render();
  }

}