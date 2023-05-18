import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_app/model/address.dart';
import 'package:my_app/model/citizen.dart';
import 'package:my_app/model/contact.dart';

import 'dart:async';
import 'dart:convert';

import 'package:my_app/model/documents.dart';

import 'package:my_app/themes/theme_colors.dart';

const request = "http://192.168.208.41:8080/cidadao";
/*
class TestandoEssabomba extends StatelessWidget {
  const TestandoEssabomba({Key? key}) : super(key: key);

   Future<Citizen> buscarCidadao() async {
    final response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      print('object');
      final json = jsonDecode(response.body);
      final content = json['content'];
      if (content != null && content.isNotEmpty) {
        final citizen = content[0];

        final primeiroContato = citizen['contato'][0];
        final primeiroEndereco = citizen['endereco'][0];
        print('object');
        return Citizen.attributes(
          citizen['id'].toString(),
          citizen['nome'],
          citizen['dataDeNascimento'],
          citizen['etnia'],
          citizen['genero'],
          Contact.attributes(
            id: primeiroContato['id'],
            email: primeiroContato['email'] ?? '',
            telefone: primeiroContato['telefone'] ?? '',
            celular: primeiroContato['celular'] ?? '',
          ),
          Address.attributes(
            id: primeiroEndereco['id'],
            logradouro: primeiroEndereco['logradouro'] ?? '',
            bairro: primeiroEndereco['bairro'] ?? '',
            cep: primeiroEndereco['cep'] ?? '',
            cidade: primeiroEndereco['cidade'] ?? '',
            complemento: primeiroEndereco['complemento'] ?? '',
            numero: primeiroEndereco['numero'] ?? '',
            // pais: primeiroEndereco['pais'] ?? '',
            uf: primeiroEndereco['uf'] ?? '',
          ),
          "assets/images/ISA.jpeg",
          citizen['situacaoEscolar'],
          Documents.attributes(
            certidaoDeNascimento:
                citizen['documentos']['certidaoDeNascimento'] ?? '',
            rg: citizen['documentos']['rg'] ?? '',
            cpf: citizen['documentos']['cpf'] ?? '',
          ),
          citizen['escolaridade'],
        );
      }
    }
    throw Exception();
  }*/

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Citizen>(
      future: buscarCidadao(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Se a requisição estiver em andamento, exibe um indicador de carregamento
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print('cai aq');
          return Text(
            'Erro: ${snapshot.error}, ',
            style: TextStyle(color: Colors.amber, fontSize: 22),
          );
        } else {
          // Se a requisição for bem-sucedida, exibe o nome do usuário
          final nomeUsuario = snapshot.data!;
          print(nomeUsuario);
          return Text(
            'Nome: ${nomeUsuario.endereco.bairro} ',
            style: TextStyle(color: Colors.amber, fontSize: 22),
          );
        }
      },
    ));
  }
} */
/* FutureBuilder<ContactTest>(
      future: buscarContato(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Se a requisição estiver em andamento, exibe um indicador de carregamento
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print('cai aq');
          return Text('Erro: ${snapshot.error}');
        } else {
          // Se a requisição for bem-sucedida, exibe o nome do usuário
          final nomeUsuario = snapshot.data!.email.toString();
          return Text('Nome: $nomeUsuario');
        }
      },
    );*/