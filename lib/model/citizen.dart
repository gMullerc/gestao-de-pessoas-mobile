import 'package:flutter/material.dart';
import 'package:my_app/model/person.dart';

class Citizen extends Person {
  const Citizen(
      {required super.id,
      required super.name,
      required super.description,
      required super.image});
}
