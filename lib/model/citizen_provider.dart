import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';

class CidadaoProvider extends ChangeNotifier {
  late Citizen _citizen;

  Citizen get citizen => _citizen;

  void setCidadao(Citizen citizen) {
    _citizen = citizen;
    notifyListeners();
  }

  void updateCitizen(Citizen cit) {
    _citizen.name = cit.name;

    _citizen.endereco.logradouro = cit.endereco.logradouro;
    _citizen.endereco.numero = cit.endereco.numero;
    _citizen.endereco.bairro = cit.endereco.bairro;

    _citizen.endereco.complemento = cit.endereco.complemento;
    _citizen.endereco.cep = cit.endereco.cep;
    _citizen.endereco.cidade = cit.endereco.cidade;

    _citizen.endereco.uf = cit.endereco.uf;
    _citizen.endereco.pais = cit.endereco.pais;

    _citizen.contato.email = cit.contato.email;
    _citizen.contato.celular = cit.contato.celular;
    _citizen.contato.telefone = cit.contato.telefone;

    notifyListeners();
  }
}
