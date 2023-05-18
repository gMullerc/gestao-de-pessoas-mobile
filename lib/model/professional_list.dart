import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/data/professional_list.dart';
import 'package:my_app/model/professional.dart';

class ProfessionalList with ChangeNotifier {
  final List<Professional> _items = professionalList;

  List<Professional> get items => [..._items];

  /*void addCitizen(Professional citizen) {
    _items.insert(
      0,
      Professional.attributes(
          id: Random().nextInt(100),
          name: citizen.name,
          dataDeNascimento: citizen.dataDeNascimento,
          genero: citizen.genero,
          etnia: citizen.etnia,
          contato:  citizen.contato,
          endereco: citizen.endereco,
          image: citizen.image,
          escolaridade: citizen.escolaridade,
          documentos: citizen.documentos,
          situacaoEscolar: citizen.situacaoEscolar,
          cargo: citizen.cargo,
          remuneracao: citizen.remuneracao,
          tipoDeProfissional: citizen.tipoDeProfissional,
          professionalDocuments: citizen.professionalDocuments),
    );
    notifyListeners();
  }*/

  /* void removeItem(Professional professional) {
    if (_items.contains(professional)) {
      _items.remove(professional);
    }

    notifyListeners();
  }*/
}
