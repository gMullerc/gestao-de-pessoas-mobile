import 'package:flutter/material.dart';

import 'address.dart';
import 'contact.dart';

class Person with ChangeNotifier {
  late int id;
  late String name;
  late String dataDeNascimento;
  late String etnia;
  late String genero;
  late Contact contato;
  late Address endereco;
  late String imagem;
  Person();
  Person.attributes(
      {required this.id,
      required this.name,
      required this.dataDeNascimento,
      required this.etnia,
      required this.genero,
      required this.contato,
      required this.endereco,
      required this.imagem});
}
