import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Person with ChangeNotifier {
  late String? _id = Uuid().v1();
  late String? _name = "";
  late String? _dataDeNascimento = "";
  late String? _etnia = "";
  late String? _genero = "";
  late Contact? _contato = Contact();
  late Address? _endereco = Address();
  late String? _image = "assets/images/sem_foto.png";
  Person();
  Person.attributes(this._id, this._name, this._dataDeNascimento, this._etnia,
      this._genero, this._contato, this._endereco, this._image);

  set name(String value) {
    _name = value;
  }

  set contato(Contact value) {
    _contato = value;
  }

  set endereco(Address value) {
    _endereco = value;
  }

  set dataDeNascimento(String value) {
    _dataDeNascimento = value;
  }

  set etnia(String value) {
    _etnia = value;
  }

  set genero(String value) {
    _genero = value;
  }

  set image(String value) {
    _image = value;
  }

  set person(Person value) {
    _name = value.name;
    _contato?.celular = value.contato.celular;
    _contato?.telefone = value.contato.telefone;
    _contato?.email = value.contato.email;

    _endereco!.logradouro = value.endereco.logradouro;
    _endereco!.bairro = value.endereco.bairro;
    _endereco!.cep = value.endereco.cep;
    _endereco!.numero = value.endereco.numero;
    _endereco!.complemento = value.endereco.complemento;
    _endereco!.uf = value.endereco.uf;
    _endereco!.cidade = value.endereco.cidade;
    _endereco!.pais = value.endereco.pais;
  }

  String get id => _id!;
  String get name => _name!;
  String get etnia => _etnia!;
  Address get endereco => _endereco!;
  String get dataDeNascimento => _dataDeNascimento!;
  Contact get contato => _contato!;
  String get genero => _genero!;
  String get image => _image!;
  @override
  String toString() {
    // TODO: implement toString
    return _contato!.email +
        "\n" +
        _contato!.celular +
        "\n" +
        _contato!.telefone;
  }
}
