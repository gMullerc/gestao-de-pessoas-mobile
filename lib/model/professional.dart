import 'package:flutter/material.dart';
import 'package:my_app/model/citizen.dart';

class Professional extends Citizen {
  const Professional(
      {required super.id,
      required super.name,
      required super.description,
      required super.image});
}
