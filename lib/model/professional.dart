import 'package:my_app/model/address.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional_documentes.dart';

class Professional extends Citizen {
  late String cargo;
  late String remuneracao;
  late String tipoDeProfissional;
  late ProfessionalDocuments professionalDocuments;

  Professional();
  Professional.attributes(
      {required int id,
      required String name,
      required String dataDeNascimento,
      required String etnia,
      required String genero,
      required Contact contato,
      required Address endereco,
      required String imagem,
      required String situacaoEscolar,
      required Documents documentos,
      required String escolaridade,
      required this.cargo,
      required this.remuneracao,
      required this.tipoDeProfissional,
      required this.professionalDocuments})
      : super.attributes(
            id: id,
            name: name,
            dataDeNascimento: dataDeNascimento,
            etnia: etnia,
            genero: genero,
            contato: contato,
            endereco: endereco,
            imagem: imagem,
            situacaoEscolar: situacaoEscolar,
            documentos: documentos,
            escolaridade: escolaridade);
}
