part of ipa;

class StringView extends AbstractView {

  String _value;

  StringView(this._value);

  String render() {
    return this._value;
  }

}