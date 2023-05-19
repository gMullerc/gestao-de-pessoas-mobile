import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:image/image.dart' as img;
import '../utils/image_decode.dart';
import 'citizen.dart';

class CitizenList with ChangeNotifier {
  //final baseUrl = "http://192.168.208.41:8080/cidadao";
  final baseUrl = "http://10.0.1.186:8080/cidadao";

  final List<Citizen> _items = [];
  int get itemsCount {
    return _items.length;
  }

  List<Citizen> get items => _items;

  Future<void> updateCitizen(Citizen citizenData) async {
    await http.put(
      headers: {'Content-Type': 'application/json'},
      Uri.parse(baseUrl),
      body: jsonEncode(
        {
          'id': citizenData.id,
          'imagem': citizenData.imagem,
          'nome': citizenData.name,
          'dataDeNascimento': citizenData.dataDeNascimento,
          'etnia': citizenData.etnia,
          'genero': citizenData.genero,
          'endereco': [
            {
              'logradouro': citizenData.endereco.logradouro,
              'cep': citizenData.endereco.cep,
              'numero': citizenData.endereco.numero,
              'bairro': citizenData.endereco.bairro,
              'uf': citizenData.endereco.uf,
              'complemento': citizenData.endereco.complemento,
              'cidade': citizenData.endereco.cidade,
            },
          ],
          'contato': [
            {
              'email': citizenData.contato.email,
              'telefone': citizenData.contato.telefone,
              'celular': citizenData.contato.celular,
            }
          ],
          'situacaoEscolar': citizenData.situacaoEscolar,
          'documentos': {
            'rg': citizenData.documentos.rg,
            'cpf': citizenData.documentos.cpf,
            'certidaDeNascimento': citizenData.documentos.certidaoDeNascimento,
          },
          'escolaridade': citizenData.escolaridade,
        },
      ),
    );
  }

  Future<void> removeItem(Citizen citizen) async {
    int index = _items.indexWhere((p) => p.id == citizen.id);

    if (index >= 0) {
      final citizen = _items[index];
      _items.remove(citizen);
      notifyListeners();

      final response = await http.delete(
        Uri.parse('$baseUrl/${citizen.id}'),
      );

      if (response.statusCode >= 400) {
        _items.insert(index, citizen);
        notifyListeners();
        throw Exception();
      }

      notifyListeners();
    }
  }

  Future<void> loadCitizen() async {
    print('chamado');
    _items.clear();

    final response = await http.get(
      Uri.parse(baseUrl),
    );
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> citizens = data['content'];

    for (var citizenData in citizens) {
      _items.add(
        Citizen.attributes(
          id: citizenData['id'],
          name: citizenData['nome'],
          dataDeNascimento: citizenData['dataDeNascimento'],
          etnia: citizenData['etnia'],
          genero: citizenData['genero'],
          contato: Contact.attributes(
            id: 1,
            email: citizenData['contato'][0]['email'],
            telefone: citizenData['contato'][0]['telefone'],
            celular: citizenData['contato'][0]['celular'],
          ),
          endereco: Address.attributes(
            id: 1,
            logradouro: citizenData['endereco'][0]['logradouro'],
            bairro: citizenData['endereco'][0]['bairro'],
            cep: citizenData['endereco'][0]['cep'],
            numero: citizenData['endereco'][0]['numero'],
            complemento: citizenData['endereco'][0]['complemento'],
            cidade: citizenData['endereco'][0]['cidade'],
            uf: citizenData['endereco'][0]['uf'],
          ),
          imagem: citizenData['imagem'],
          situacaoEscolar: citizenData['situacaoEscolar'],
          documentos: Documents.attributes(
            rg: citizenData['documentos']['rg'],
            cpf: citizenData['documentos']['cpf'],
            certidaoDeNascimento: citizenData['documentos']
                ['certidaDeNascimento'],
          ),
          escolaridade: citizenData['escolaridade'],
        ),
      );
    }

    notifyListeners();
  }

  Future<void> addCitizen(Citizen citizenData) async {
    File imageFile = File(citizenData.imagem);

    if (imageFile.existsSync()) {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      final base64Image = base64Encode(img.encodePng(image!));

      await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'nome': citizenData.name,
            'dataDeNascimento': citizenData.dataDeNascimento,
            'etnia': citizenData.etnia,
            'genero': citizenData.genero,
            'contato': [
              {
                'email': citizenData.contato.email,
                'telefone': citizenData.contato.telefone,
                'celular': citizenData.contato.celular,
              }
            ],
            'endereco': [
              {
                'logradouro': citizenData.endereco.logradouro,
                'cep': citizenData.endereco.cep,
                'numero': citizenData.endereco.numero,
                'bairro': citizenData.endereco.bairro,
                'uf': citizenData.endereco.uf,
                'complemento': citizenData.endereco.complemento,
                'cidade': citizenData.endereco.cidade,
              },
            ],
            'imagem': base64Image,
            'situacaoEscolar': citizenData.situacaoEscolar,
            'documentos': {
              'rg': citizenData.documentos.rg,
              'cpf': citizenData.documentos.cpf,
              'certidaDeNascimento':
                  citizenData.documentos.certidaoDeNascimento,
            },
            'escolaridade': citizenData.escolaridade,
          },
        ),
      );
    }

    notifyListeners();
  }
}
