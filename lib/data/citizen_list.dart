import 'package:my_app/model/address.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';

var citizenList = [
  Citizen.attributes(
      "1",
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
      "1",
      "Igor Birilosh da silva",
      "01/08/2022",
      "MASCULINO",
      "PARDO",
      Contact.attributes("igor@gmail.com", "(11) 985421298", "(11) 5512-0429"),
      Address.attributes(
          "Chinigua", "Inga", "05736100", "A", "", "São Paulo", "SP", "Brasil"),
      "assets/images/ISA.jpeg",
      "CURSANDO",
      Documents.attributes("504.488.896-85", "54.987.787-X", "12344/8454"),
      "MEDIO"),
  Citizen.attributes(
      "2",
      "Isabella",
      "01/08/2022",
      "MASCULINO",
      "PARDO",
      Contact.attributes(
          "isabella@gmail.com", "(11) 9967-5493", "(11) 954445-4049"),
      Address(),
      "assets/images/ISA.jpeg",
      "CURSANDO",
      Documents(),
      "MEDIO"),
];
