class Address {
  late int id;
  late String logradouro;
  late String bairro;
  late String cep;
  late String numero;
  late String complemento = "";
  late String cidade;
  late String uf;
  //late String pais;
  Address.attributes({
    required this.id,
    required this.logradouro,
    required this.bairro,
    required this.cep,
    required this.numero,
    required this.complemento,
    required this.cidade,
    required this.uf,
    //required this.pais
  });

  Address();

  set pais(pais) {}
}
