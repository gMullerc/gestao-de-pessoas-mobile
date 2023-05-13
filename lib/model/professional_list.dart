import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/data/professional_list.dart';
import 'package:my_app/model/professional.dart';

class ProfessionalList with ChangeNotifier {
  final List<Professional> _items = professionalList;

  List<Professional> get items => [..._items];

  void addCitizen(Professional citizen) {
    _items.insert(
      0,
      Professional.attributes(
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
          citizen.situacaoEscolar,
          citizen.cargo,
          citizen.remuneracao,
          citizen.tipoDeProfissional,
          citizen.professionalDocuments),
    );
    notifyListeners();
  }

  void removeItem(String professionalId) {
    _items.remove(professionalId);
    notifyListeners();
  }
}
