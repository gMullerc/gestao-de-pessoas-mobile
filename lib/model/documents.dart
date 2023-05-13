class Documents {
  late String _cpf;
  late String _rg;
  late String _certidaoDeNascimento;

  Documents();
  Documents.attributes(this._cpf, this._rg, this._certidaoDeNascimento);

  set cpf(String value) {
    _cpf = value;
  }

  set rg(String value) {
    _rg = value;
  }

  set certidaoDeNascimento(String value) {
    _certidaoDeNascimento = value;
  }

  String get cpf => _cpf;
  String get rg => _rg;
  String get certidaoDeNascimento => _certidaoDeNascimento;
}
