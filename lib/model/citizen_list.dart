import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:io' as Io;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_app/model/address.dart';
import 'package:my_app/model/contact.dart';
import 'package:my_app/model/documents.dart';
import 'package:image/image.dart' as img;
import 'citizen.dart';

class CitizenList with ChangeNotifier {
  //final baseUrl = "http://192.168.208.41:8080/cidadao";
  final baseUrl = "http://10.0.1.186:8080/cidadao";

  final List<Citizen> _items = [];

  List<Citizen> get items => _items;

  Future<void> updateCitizen(Citizen citizenData) async {
    File imageFile = File(citizenData.imagem);

    if (imageFile.existsSync()) {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      final base64Image = base64Encode(img.encodePng(image!));

      await http.put(
        Uri.parse('${baseUrl}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'id': citizenData.id,
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
            'imagem': '$base64Image',
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

  void removeItem(Citizen citizen) {
    if (_items.contains(citizen)) {
      _items.remove(citizen);
    }

    notifyListeners();
  }

  Future<void> loadCitizen() async {
    _items.clear();

    final response = await http.get(
      Uri.parse('${baseUrl}'),
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
        Uri.parse('${baseUrl}'),
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
            'imagem': '$base64Image',
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

    // Codifique a imagem em base64

    notifyListeners();
  }
}
