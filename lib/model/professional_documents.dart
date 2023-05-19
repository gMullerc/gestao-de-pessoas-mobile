class ProfessionalDocuments {
  late String _pis;
  late String _carteiraDeTrabalho;

  ProfessionalDocuments();
  ProfessionalDocuments.attributes(this._pis, this._carteiraDeTrabalho);

  set pis(String value) {
    _pis = value;
  }

  set carteiraDeTrabalho(String value) {
    _carteiraDeTrabalho = value;
  }

  String get pis => _pis!;
  String get carteiraDeTrabalho => _carteiraDeTrabalho!;
}
