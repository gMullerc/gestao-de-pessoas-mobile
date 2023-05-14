import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/person.dart';
import 'package:provider/provider.dart';

class Citizen extends Person {
  late String? _situacaoEscolar = "";
  late String? _escolaridade = "";
  late Documents? _documentos;

  Citizen();
  Citizen.attributes(
      String _id,
      String _name,
      String _dataDeNascimento,
      String _etnia,
      String _genero,
      Contact _contato,
      Address _endereco,
      String _image,
      this._situacaoEscolar,
      this._documentos,
      this._escolaridade)
      : super.attributes(_id, _name, _dataDeNascimento, _etnia, _genero,
            _contato, _endereco, _image);

  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen.attributes(
      json['id'],
      json['nome'],
      json['dataDeNascimento'],
      json['etnia'],
      json['genero'],
      json['contato'],
      json['endereco'], "assets/images/ISA.jpeg",
      json['situacaoEscolar'],
      json['documentos'], json['escolaridade'],
      // ... outros campos
    );
  }
  set situacaoEscolar(String value) {
    _situacaoEscolar = value;
  }

  set escolaridade(String value) {
    _escolaridade = value;
  }

  set documentos(Documents value) {
    _documentos = value;
  }

  String get situacaoEscolar => _situacaoEscolar!;
  String get escolaridade => _escolaridade!;
  Documents get documentos => _documentos!;
}
