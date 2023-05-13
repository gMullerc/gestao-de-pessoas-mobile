import 'package:my_app/model/address.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';

var citizenList = [
  Citizen.attributes(
      "3",
      "Igor Birilosh da silva",
      "01/08/2022",
      "MASCULINO",
      "PARDO",
      Contact.attributes("igor@gmail.com", "(11) 985421298", "(11) 5512-0429"),
      Address.attributes(
          "Chinigua", "Inga", "05736100", "A", "", "São Paulo", "SP", "Brasil"),
      "assets/images/IGOR.jpeg",
      "CURSANDO",
      Documents.attributes("314.488.896-85", "55.987.787-X", "12344/8454"),
      "MEDIO"),
  Citizen.attributes(
      "4",
      "Isabela Birilosh da silva",
      "01/08/2022",
      "FEMININO",
      "BRANCO",
      Contact.attributes("isa@gmail.com", "(11) 985421298", "(11) 5512-0429"),
      Address.attributes(
          "Chinigua", "Inga", "05736100", "A", "", "São Paulo", "SP", "Brasil"),
      "assets/images/ISA.jpeg",
      "CURSANDO",
      Documents.attributes("504.488.896-85", "54.987.787-X", "12344/8454"),
      "MEDIO"),
];
