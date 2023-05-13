import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/data/citizen_list.dart';

import 'citizen.dart';

class CitizenList with ChangeNotifier {
  final List<Citizen> _items = citizenList;

  List<Citizen> get items => _items;

  void addCitizen(Citizen citizen) {
    _items.insert(
      0,
      Citizen.attributes(
          Random().nextDouble().toString(),
          citizen.name,
          citizen.dataDeNascimento,
          citizen.genero,
          citizen.etnia,
          citizen.contato,
          citizen.endereco,
          citizen.image,
          citizen.escolaridade,
          citizen.documentos,
          citizen.situacaoEscolar),
    );
    notifyListeners();
  }

  void removeItem(String citizenId) {
    _items.remove(citizenId);
    notifyListeners();
  }

  void updateCitizen(Citizen cit) {
    Citizen citizen = _items.firstWhere(
      (element) => element == cit,
    );
    citizen.name = cit.name;

    citizen.endereco.logradouro = cit.endereco.logradouro;
    citizen.endereco.numero = cit.endereco.numero;
    citizen.endereco.bairro = cit.endereco.bairro;

    citizen.endereco.complemento = cit.endereco.complemento;
    citizen.endereco.cep = cit.endereco.cep;
    citizen.endereco.cidade = cit.endereco.cidade;

    citizen.endereco.uf = cit.endereco.uf;
    citizen.endereco.pais = cit.endereco.pais;

    citizen.contato.email = cit.contato.email;
    citizen.contato.celular = cit.contato.celular;
    citizen.contato.telefone = cit.contato.telefone;

    notifyListeners();
  }
}
