class Address {
  late String _logradouro = "";
  late String _bairro = "";
  late String _cep = "";
  late String _numero = "";
  late String _complemento = "";
  late String _cidade = "";
  late String _uf = "";
  late String _pais = "";
  Address.attributes(this._logradouro, this._bairro, this._cep, this._numero,
      this._complemento, this._cidade, this._uf, this._pais);
  set logradouro(String value) {
    _logradouro = value;
  }

  set bairro(String value) {
    _bairro = value;
  }

  set cep(String value) {
    _cep = value;
  }

  set numero(String value) {
    _numero = value;
  }

  set complemento(String value) {
    _complemento = value;
  }

  set cidade(String value) {
    _cidade = value;
  }

  set uf(String value) {
    _uf = value;
  }

  set pais(String value) {
    _pais = value;
  }

  String get logradouro => _logradouro;
  String get cidade => _cidade;
  String get numero => _numero;
  String get complemento => _complemento;
  String get bairro => _bairro;
  String get pais => _pais;
  String get uf => _uf;
  String get cep => _cep;
  Address();
}
