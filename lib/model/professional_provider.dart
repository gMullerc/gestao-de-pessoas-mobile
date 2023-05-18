import 'package:flutter/material.dart';
import 'package:my_app/model/professional.dart';

class ProfessionalProvider extends ChangeNotifier {
  late Professional _professional;

  Professional get professional => _professional;

  void setProfessional(Professional professional) {
    _professional = professional;
    notifyListeners();
  }

  void updateProfessional(Professional professional) {
    _professional.name = professional.name;

    _professional.endereco!.logradouro = professional.endereco!.logradouro;
    _professional.endereco!.numero = professional.endereco!.numero;
    _professional.endereco!.bairro = professional.endereco!.bairro;

    _professional.endereco!.complemento = professional.endereco.complemento;
    _professional.endereco!.cep = professional.endereco!.cep;
    _professional.endereco!.cidade = professional.endereco!.cidade;

    _professional.endereco!.uf = professional.endereco!.uf;
    // _professional.endereco.pais = professional.endereco.pais;

    _professional.contato!.email = professional.contato!.email;
    _professional.contato!.celular = professional.contato!.celular;
    _professional.contato!.telefone = professional.contato!.telefone;

    _professional.cargo = professional.cargo;
    _professional.remuneracao = professional.remuneracao;
    _professional.tipoDeProfissional = professional.tipoDeProfissional;
    notifyListeners();
  }
}
