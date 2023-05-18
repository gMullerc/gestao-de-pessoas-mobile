import 'package:my_app/model/person.dart';

import 'address.dart';
import 'contact.dart';
import 'documents.dart';

class Citizenn extends Person {
  late String situacaoEscolar = "";
  late String escolaridade = "";
  late Documents documentos;

  Citizenn();
  Citizenn.attributes(
      {required int id,
      required String name,
      required String dataDeNascimento,
      required String etnia,
      required String genero,
      required Contact contato,
      required Address endereco,
      required String imagem,
      required this.situacaoEscolar,
      required this.documentos,
      required this.escolaridade})
      : super.attributes(
            id: id,
            name: name,
            dataDeNascimento: dataDeNascimento,
            etnia: etnia,
            genero: genero,
            contato: contato,
            endereco: endereco,
            imagem: imagem);
}
