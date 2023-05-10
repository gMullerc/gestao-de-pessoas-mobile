import 'package:my_app/model/address.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:my_app/model/professional_documentes.dart';

class Professional extends Citizen {
  late String? _cargo;
  late String? _remuneracao;
  late String? _tipoDeProfissional;
  late ProfessionalDocuments? _professionalDocuments;

  Professional();
  Professional.attributes(
      String _id,
      String _name,
      String _dataDeNascimento,
      String _etnia,
      String _genero,
      Contact _contato,
      Address _endereco,
      String _image,
      String _situacaoEscolar,
      Documents _documentos,
      String _escolaridade,
      this._cargo,
      this._remuneracao,
      this._tipoDeProfissional,
      this._professionalDocuments)
      : super.attributes(
            _id,
            _name,
            _dataDeNascimento,
            _etnia,
            _genero,
            _contato,
            _endereco,
            _image,
            _situacaoEscolar,
            _documentos,
            _escolaridade);

  String get cargo => _cargo!;
  String get remuneracao => _remuneracao!;
  String get tipoDeProfissional => _tipoDeProfissional!;
  ProfessionalDocuments get professionalDocuments => _professionalDocuments!;
}
