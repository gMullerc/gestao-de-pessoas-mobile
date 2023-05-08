class Contact {
  late String _email = "";
  late String _telefone = "";
  late String _celular = "";

  Contact();
  Contact.attributes(this._email, this._telefone, this._celular);

  set email(String value) {
    _email = value;
  }

  set telefone(String value) {
    _telefone = value;
  }

  set celular(String value) {
    _celular = value;
  }

  String get email => _email;
  String get telefone => _telefone;
  String get celular => _celular;
}
