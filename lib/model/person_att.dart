import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';

class Person with ChangeNotifier {
  final String _id;
  final String _name;
  final String _dataDeNascimento;
  final String _etnia;
  final String _genero;
  final Contact _contato;
  final Address _endereco;
  final String _image;

  Person(this._id, this._name, this._dataDeNascimento, this._etnia,
      this._genero, this._contato, this._endereco, this._image);
}
