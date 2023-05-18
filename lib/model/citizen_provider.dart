import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';

class CidadaoProvider extends ChangeNotifier {
  late Citizen _citizen;

  Citizen get citizen => _citizen;

  void setCidadao(Citizen citizen) {
    _citizen = citizen;
    notifyListeners();
  }
}
