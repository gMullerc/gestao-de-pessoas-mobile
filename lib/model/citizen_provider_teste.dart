import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/service/citizen_service.dart';

class CitizenProvider extends ChangeNotifier {
  final CitizenService _citizenService = CitizenService();
  List<Citizen> _citizens = [];
  List<Citizen> get citizens => _citizens;

  void addCitizen(Citizen citizen) {
    _citizens.insert(
      0,
      Citizen.attributes(
          citizen.id,
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

  Future<void> fetchUsers() async {
    try {
      _citizens = await _citizenService.fetchUsers();
      notifyListeners();
    } catch (error) {
      throw Exception('Erro na requisição');
    }
  }
}
