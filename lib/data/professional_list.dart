import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional.dart';
import 'package:my_app/model/professional_documentes.dart';

var professionalList = [
  Professional.attributes(
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
    "MEDIO",
    "Desenvolvedor trainee",
    "2200.00",
    "CLT",
    ProfessionalDocuments.attributes("12331", "333222"),
  ),
  Professional.attributes(
    "2",
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
    "MEDIO",
    "Desenvolvedor trainee",
    "2200.00",
    "CLT",
    ProfessionalDocuments.attributes("12331", "333222"),
  ),
];
